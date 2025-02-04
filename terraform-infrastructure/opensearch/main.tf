locals {
  opensearch_availability_zone_count = try(var.opensearch_data_node_instance_count, null) #var.opensearch_data_node_instance_count
  opensearch_zone_awareness_config = {
    availability_zone_count = try(var.opensearch_data_node_instance_count, null) #var.opensearch_data_node_instance_count
  }
  opensearch_is_t2_or_t3_instance_type        = substr(try(var.opensearch_instance_type,null), 0, 1) != "t" # auto tune option is not available for t series intance type
  opensearch_domain_name                      = "${var.region_short}-${var.environment_name}-osearch-0"
  opensearch_security_group_name              = "${var.region_short}-${var.environment_name}-osearch-0-security-group"
  opensearch_security_group_ingress_rule_name = "${var.region_short}-${var.environment_name}-opensearch-0-security-group-ingress-rule"
  opensearch_additional_tags = {
    customer_critical = "true"
  }
  opensearch_helpers_additional_tags = {
    customer_critical = "false"
  }
}

# Documentation here 
# https://github.com/terraform-aws-modules/terraform-aws-opensearch/tree/master/examples/complete
# https://registry.terraform.io/modules/terraform-aws-modules/opensearch/aws/latest

# TODO start backup before maintenance



module "opensearch" {
  source  = "terraform-aws-modules/opensearch/aws"
  version = "1.3.1"
  for_each = var.opensearch_configs
  # Domain
  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  advanced_security_options = {
    enabled                        = false
    anonymous_auth_enabled         = true
    internal_user_database_enabled = true

    master_user_options = { # TODO Fix password problem
      master_user_name     = "opensearch-user"
      master_user_password = "OpenSearchPassword@2024"
    }
  }

  #  Autotune is not supported in t2/t3 instance types
  auto_tune_options = {
    #desired_state = var.opensearch_is_t2_or_t3_instance_type ? "DISABLED" : "ENABLED"
    desired_state = try(each.value.opensearch_is_t2_or_t3_instance_type,null) ? "DISABLED" : "ENABLED"
    maintenance_schedule = [
      {
        start_at                       = "2028-05-13T07:44:12Z"
        cron_expression_for_recurrence = "cron(0 0 ? * 1 *)"
        duration = {
          value = "2"
          unit  = "HOURS"
        }
      }
    ]

    rollback_on_disable = "NO_ROLLBACK"
  }


  cluster_config = {
    instance_count           = try(each.value.opensearch_data_node_instance_count,null) #var.opensearch_data_node_instance_count
    dedicated_master_enabled = try(each.value.opensearch_dedicated_master_enabled,null) #var.opensearch_dedicated_master_enabled
    # dedicated_master_type    = "c6g.large.search"
    instance_type = try(each.value.opensearch_instance_type,null) #var.opensearch_instance_type


    zone_awareness_enabled = false
  }

  domain_endpoint_options = {
    enforce_https       = true
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
  }

  domain_name = local.opensearch_domain_name

  ebs_options = try(each.value.opensearch_ebs_configurations,null) #var.opensearch_ebs_configurations

  encrypt_at_rest = {
    enabled    = try(each.value.opensearch_encrypt_at_rest,null) #var.opensearch_encrypt_at_rest
    #kms_key_id = module.kms.key_arn
    kms_key_id = try(each.value.kms_key_id_arn,null) #var.kms_key_id_arn
  }

  engine_version = try(each.value.opensearch_engine_version,null) #var.opensearch_engine_version

  log_publishing_options = [
    {
      log_type                 = "INDEX_SLOW_LOGS"
      enabled                  = true
      cloudwatch_log_group_arn = module.index-slow-log-group.cloudwatch_log_group_arn
    },
    {
      log_type                 = "SEARCH_SLOW_LOGS"
      enabled                  = true
      cloudwatch_log_group_arn = module.search-slow-log-group.cloudwatch_log_group_arn

    },
    {
      log_type                 = "ES_APPLICATION_LOGS"
      enabled                  = true
      cloudwatch_log_group_arn = module.opensearch-application-log-group.cloudwatch_log_group_arn

    },
    {
      log_type                 = "AUDIT_LOGS"
      enabled                  = false #audit log publishing can be enabled only when advanced security options configured enabled.
      cloudwatch_log_group_arn = module.audit-log-group.cloudwatch_log_group_arn

    },
  ]

  ip_address_type = "ipv4" # TODO Enable IPv4
  # ip_address_type = "dualstack"

  node_to_node_encryption = {
    enabled = true
  }

  software_update_options = {
    auto_software_update_enabled = try(each.value.opensearch_software_update_options,null) #var.opensearch_software_update_options
  }

  vpc_options = {
    #subnet_ids         = var.opensearch_data_node_instance_count > 1 ? module.vpc.private_subnets : [module.vpc.private_subnets[0]]
    subnet_ids = try(each.value.subnet_ids, null) #var.subnet_ids
    security_group_ids = try([module.opensearch_security_group.security_group_id],[])
    #security_group_ids = try([each.value.security_group_id], null)
  }
  create_security_group = false


  # Access policy
  #TODO put policy into a file
  create_access_policy = false
  access_policy_statements = [
    {
      effect = "Allow"

      principal = "*"

      actions  = ["es:*"]
      #resource = ["arn:aws:es:${var.region}:${data.aws_caller_identity.current.account_id}:domain/${local.opensearch_domain_name}/*"]
    }
  ]
  tags = merge(
    local.common_tags,
    local.opensearch_additional_tags
  )

  # tags = local.tags # TODO add tags
}


# Cloudwatch Logs
# Docs
# https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/blob/master/examples/log-group-with-log-stream/main.tf
# https://registry.terraform.io/modules/terraform-aws-modules/cloudwatch/aws/latest
module "index-slow-log-group" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/log-group"
  version = "5.5.0"

  name              = "${local.opensearch_domain_name}-index-slow-log-group"
  retention_in_days = 7
  tags = merge(
    local.common_tags,
    local.opensearch_helpers_additional_tags
  )
}

module "search-slow-log-group" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/log-group"
  version = "5.5.0"

  name              = "${local.opensearch_domain_name}-search-slow-log-group"
  retention_in_days = 7
  tags = merge(
    local.common_tags,
    local.opensearch_helpers_additional_tags
  )
}

module "opensearch-application-log-group" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/log-group"
  version = "5.5.0"

  name              = "${local.opensearch_domain_name}-opensearch-application-log-group"
  retention_in_days = 7
  tags = merge(
    local.common_tags,
    local.opensearch_helpers_additional_tags
  )
}

module "audit-log-group" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/log-group"
  version = "5.5.0"

  name              = "${local.opensearch_domain_name}-audit-log-group"
  retention_in_days = 7
  tags = merge(
    local.common_tags,
    local.opensearch_helpers_additional_tags
  )
}


# opensearch security group
# Doc here
# https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest

module "opensearch_security_group" {  
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"
  for_each = var.opensearch_configs
  name        = local.opensearch_security_group_name
  description = "Security group used by opensearch"
  vpc_id      = try(each.value.vpc_id,null) #var.vpc_id

  egress_rules    = try(each.value.opensearch_security_group_egress_rules,null)
  use_name_prefix = false

  ingress_with_cidr_blocks = [
    {
      rule        = "elasticsearch-rest-tcp"
      #cidr_blocks = module.vpc.vpc_cidr_block
      cidr_blocks = try(each.value.vpc_cidr_block,"")
      name        = "${local.opensearch_security_group_ingress_rule_name}-1"
      description = "opensearch security group 1"
    },
    {
      rule        = "elasticsearch-java-tcp"
      #cidr_blocks = module.vpc.vpc_cidr_block
      cidr_blocks = try(each.value.vpc_cidr_block,"")
      name        = "${local.opensearch_security_group_ingress_rule_name}-2"
      description = "opensearch security group 2"
    },
  ]
  tags = merge(
    local.common_tags,
    local.opensearch_helpers_additional_tags
  )
}
