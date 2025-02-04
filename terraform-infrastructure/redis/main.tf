locals {
  redis_cache_name                       = "${var.region_short}-${var.environment_name}-redis-0"
  redis_security_group_name              = "${var.region_short}-${var.environment_name}-redis-0-security-group"
  redis_security_group_ingress_rule_name = "${var.region_short}-${var.environment_name}-postgresql-0-security-group-ingress-rule"
  #   postgresql_monitoring_role_name             = "${var.region_short}-${var.environment_name}-postgresql-0-monitoring-role"
  redis_additional_tags = {
    customer_critical = "true"
  }
  redis_helpers_additional_tags = {
    customer_critical = "false"
  }
}

# Documentation here 
# https://github.com/terraform-aws-modules/terraform-aws-elasticache/tree/master/modules/serverless-cache
# https://registry.terraform.io/modules/terraform-aws-modules/elasticache/aws/latest/submodules/serverless-cache

#TODO take snapshot and then do minor version upgrades automatically
module "elasticache_serverless_cache" {
  source  = "terraform-aws-modules/elasticache/aws//modules/serverless-cache"
  version = "1.2.2"
  for_each = var.redis_config
  engine     = try(each.value.redis_engine,null)
  cache_name = local.redis_cache_name

  cache_usage_limits = {
    data_storage = {
      maximum = 2
    }
    ecpu_per_second = {
      maximum = 1000
    }
  }

  daily_snapshot_time  = try(each.value.redis_daily_snapshot_time,null) #var.redis_daily_snapshot_time
  description          = "serverless-cache"
  major_engine_version = try(each.value.redis_major_engine_version,null) #var.redis_major_engine_version
  security_group_ids = try([module.redis_security_group.security_group_id],null)

  #security_group_ids = var.security_group_id

  snapshot_retention_limit = try(each.value.redis_snapshot_retention_days,null) #var.redis_snapshot_retention_days
  #subnet_ids               = module.vpc.private_subnets
  subnet_ids = try(each.value.subnet_ids,null) #var.subnet_ids
  #kms_key_id               = module.kms.key_arn
  kms_key_id = try(each.value.kms_key_id_arn,null) #var.kms_key_id_arn
  #user_group_id = module.cache_user_group.group_id
## No user group in redis console. So, need to create one. I havent created any right now
  
  timeouts = {
    create = "10m"
    delete = "10m"
    update = "15m"
  }

  tags = merge(
    local.common_tags,
    local.redis_additional_tags
  )
}

#Docs
# https://registry.terraform.io/modules/terraform-aws-modules/elasticache/aws/latest/submodules/user-group
# https://github.com/terraform-aws-modules/terraform-aws-elasticache/blob/master/modules/user-group/README.md

module "cache_user_group" {
  source  = "terraform-aws-modules/elasticache/aws//modules//user-group"
  version = "1.2.2"
  for_each = var.redis_config
  default_user = {
    access_string = "on ~* -@all +@read" #modifying this value is redundant, it gets changed again, and terraform will re-apply this value, adding 5-7 mins time every time we apply terraform apply
    user_id       = "${local.redis_cache_name}-default-user"
    passwords     = ["RedisPassword@2024"]
  }

  users = {
    lambda = {
      access_string = "on ~* +@all"
      passwords     = ["password123456789"]
    }
  }

  user_group_id = "${local.redis_cache_name}-user-group"
  tags = merge(
    local.common_tags,
    local.redis_additional_tags
  )
}

# Redis Security Group
# Doc here
# https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest


module "redis_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"
  for_each = var.redis_config
  name        = local.redis_security_group_name
  description = "Security group used by Redis"
  #vpc_id      = module.vpc.vpc_id
  vpc_id = try(each.value.vpc_id,null) #var.vpc_id

  egress_rules    = try(each.value.redis_security_group_egress_rules,null) #var.redis_security_group_egress_rules
  use_name_prefix = false

  ingress_with_cidr_blocks = [
    {
      rule        = "redis-tcp"
      #cidr_blocks = module.vpc.vpc_cidr_block
      cidr_blocks = try(each.value.vpc_cidr_block,null) #var.vpc_cidr_block
      
      name        = local.redis_security_group_ingress_rule_name
      description = "Redis"
    },
  ]
  tags = merge(
    local.common_tags,
    local.redis_helpers_additional_tags
  )
}


# TODO Implement AWS Secret Manager for fetching passwords https://spacelift.io/blog/terraform-secrets 
