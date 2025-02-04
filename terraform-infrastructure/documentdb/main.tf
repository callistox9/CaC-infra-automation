
locals {
  documentdbdb_cluster_name                   = "${var.region_short}-${var.environment_name}-documentdb-0"
  documentdb_security_group_name              = "${var.region_short}-${var.environment_name}-documentdb-0-security-group"
  documentdbdb_subnet_group_name              = "${var.region_short}-${var.environment_name}-documentdb-0-subnet-group"
  documentdb_security_group_ingress_rule_name = "${var.region_short}-${var.environment_name}-documentdb-0-security-group-ingress-rule"
  documentdb_monitoring_role_name             = "${var.region_short}-${var.environment_name}-documentdb-0-monitoring-role"
  documentdb_additional_tags = {
    customer_critical = "true"
  }
  documentdb_helpers_additional_tags = {
    customer_critical = "false"
  }
}

# Documentation here
# https://registry.terraform.io/modules/cloudposse/documentdb-cluster/aws/latest
# https://github.com/cloudposse/terraform-aws-documentdb-cluster/tree/main/examples/complete

module "documentdb_cluster" {
  source  = "cloudposse/documentdb-cluster/aws"
  version = "0.27.0"
  for_each = var.documentdb_configs

  name = local.documentdbdb_cluster_name

  cluster_size    = try(each.value.documentdb_cluster_size, null) #var.documentdb_cluster_size
  master_username = try(each.value.documentdb_master_username, null) #var.documentdb_master_username
  master_password = try(each.value.documentdb_master_password, null) #var.documentdb_master_password
  instance_class  = try(each.value.documentdb_instance_class, null) #var.documentdb_instance_class
  db_port         = try(each.value.documentdb_port, null) #var.documentdb_port
  #vpc_id          = module.vpc.vpc_id
  vpc_id          = try(each.value.vpc_id, null)
  #subnet_ids      = module.vpc.private_subnets
  subnet_ids      = try(each.value.vpc_private_subnets,null)
  # zone_id                    = null
  apply_immediately          = try(each.value.documentdb_apply_immediately,null) #var.documentdb_apply_immediately
  auto_minor_version_upgrade = try(each.value.documentdb_auto_minor_version_upgrade,null) #var.documentdb_auto_minor_version_upgrade
  allowed_security_groups    = try([module.documentdb_security_group.security_group_id],[])
  #allowed_security_groups = var.security_group_id
  # allowed_cidr_blocks             = var.documentdb_allowed_cidr_blocks
  snapshot_identifier             = try(each.value.documentdb_snapshot_identifier,null) #var.documentdb_snapshot_identifier
  retention_period                = try(each.value.documentdb_retention_period,null) #var.documentdb_retention_period
  preferred_backup_window         = try(each.value.documentdb_preferred_backup_window,null) #var.documentdb_preferred_backup_window
  preferred_maintenance_window    = try(each.value.documentdb_preferred_maintenance_window,null) #var.documentdb_preferred_maintenance_window
  cluster_parameters              = try(each.value.documentdb_cluster_parameters,null) #var.documentdb_cluster_parameters
  cluster_family                  = try(each.value.documentdb_cluster_family,null) #var.documentdb_cluster_family
  engine                          = try(each.value.documentdb_engine,null) #var.documentdb_engine
  engine_version                  = try(each.value.documentdb_engine_version,null) #var.documentdb_engine_version
  storage_type                    = try(each.value.documentdb_storage_type,null) #var.documentdb_storage_type
  storage_encrypted               = try(each.value.documentdb_storage_encrypted,null) #var.documentdb_storage_encrypted
  #kms_key_id                     = module.kms.key_arn
  kms_key_id                      = try(each.value.kms_key_id_arn,null) #var.kms_key_id_arn
  skip_final_snapshot             = try(each.value.documentdb_skip_final_snapshot,null) #var.documentdb_skip_final_snapshot
  enabled_cloudwatch_logs_exports = try(each.value.documentdb_enabled_cloudwatch_logs_exports,null) #var.documentdb_enabled_cloudwatch_logs_exports
  # cluster_dns_name                = var.documentdb_cluster_dns_name
  # reader_dns_name                 = var.documentdb_reader_dns_name
  ssm_parameter_enabled = try(each.value.documentdb_ssm_parameter_enabled,null) #var.documentdb_ssm_parameter_enabled
  # TODO Enable cloudwatch logs



  tags = merge(
    local.common_tags,
    local.documentdb_additional_tags
  )
}





# documentdb Security Group
# Doc here
# https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest
# https://github.com/terraform-aws-modules/terraform-aws-security-group/tree/master/examples/complete

module "documentdb_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"
  for_each = var.documentdb_configs
  name            = local.documentdb_security_group_name
  description     = "Security group used by documentdb"
  #vpc_id          = module.vpc.vpc_id
  vpc_id          = try(each.value.vpc_id, null) # var.vpc_id
  use_name_prefix = false

  egress_rules = try(each.value.documentdb_security_group_egress_rules, null) #var.documentdb_security_group_egress_rules

  ingress_with_cidr_blocks = [
    {
      rule        = "mongodb-27017-tcp"
      #cidr_blocks = module.vpc.vpc_cidr_block
      #cidr_blocks = join(",", var.ingress_cidr_blocks)
      cidr_blocks = try(each.value.ingress_cidr_blocks, "") #var.ingress_cidr_blocks
      name        = local.documentdb_security_group_ingress_rule_name
      description = "documentdb security group"
    },
  ]
  tags = merge(
    local.common_tags,
    local.documentdb_helpers_additional_tags
  )
}
