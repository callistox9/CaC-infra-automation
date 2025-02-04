# https://registry.terraform.io/modules/terraform-aws-modules/rds/aws/latest
# https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples/complete-postgres

locals {
  postgresql_db_cluster_name                  = "${var.region_short}-${var.environment_name}-postgresql-0"
  postgresql_security_group_name              = "${var.region_short}-${var.environment_name}-postgresql-0-security-group"
  postgresql_db_subnet_group_name             = "${var.region_short}-${var.environment_name}-postgresql-0-subnet-group"
  postgresql_security_group_ingress_rule_name = "${var.region_short}-${var.environment_name}-postgresql-0-security-group-ingress-rule"
  postgresql_monitoring_role_name             = "${var.region_short}-${var.environment_name}-postgresql-0-monitoring-role"
  postgresql_additional_tags = {
    customer_critical = "true"
  }
  postgresql_helpers_additional_tags = {
    customer_critical = "false"
  }
}

module "postgresql_db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.8.0"
  
  for_each = var.postgres_config

  identifier = local.postgresql_db_cluster_name
  #for_each = var.postgres_config
  # All available versions: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts
  engine                   = try(each.value.postgresql_engine, null)
  engine_version           = try(each.value.postgresql_engine_version, null) # var.postgresql_engine_version
  engine_lifecycle_support = "open-source-rds-extended-support-disabled"
  family                   = "postgres16"                        # DB parameter group
  major_engine_version     = try(each.value.postgresql_major_engine_version, null) # var.postgresql_major_engine_version # DB option group
  instance_class           = try(each.value.postgresql_instance_type, null) # var.postgresql_instance_type

  allocated_storage     = try(each.value.postgresql_allocated_storage, null) # var.postgresql_allocated_storage
  max_allocated_storage = try(each.value.postgresql_max_allocated_storage, null) # var.postgresql_max_allocated_storage

  # NOTE: Do NOT use 'user' as the value for 'username' as it throws:
  # "Error creating DB Instance: InvalidParameterValue: MasterUsername
  # user cannot be used as it is a reserved word used by the engine"
  db_name  = try(each.value.postgresql_db_name, null) # var.postgresql_db_name
  username = try(each.value.postgresql_username, null) # var.postgresql_username
  port     = 5432

  # Setting manage_master_user_password_rotation to false after it
  # has previously been set to true disables automatic rotation
  # however using an initial value of false (default) does not disable
  # automatic rotation and rotation will be handled by RDS.
  # manage_master_user_password_rotation allows users to configure
  # a non-default schedule and is not meant to disable rotation
  # when initially creating / enabling the password management feature
  manage_master_user_password_rotation              = true
  master_user_password_rotate_immediately           = false
  master_user_password_rotation_schedule_expression = "rate(15 days)"

  multi_az = false
  # DB subnet group
  create_db_subnet_group          = true
  db_subnet_group_name            = local.postgresql_db_subnet_group_name
  db_subnet_group_use_name_prefix = false
  db_subnet_group_description = "eb-sandbox 0 rds subnet group"
  #subnet_ids                      = module.vpc.private_subnets
  subnet_ids = try(each.value.vpc_private_subnets, null)
  vpc_security_group_ids          = try([module.postgresql_security_group.security_group_id],[])
  #vpc_security_group_ids = try(each.value.security_group_id, null) #var.security_group_id
  maintenance_window              = try(each.value.postgresql_maintenance_window, null) #var.postgresql_maintenance_window
  backup_window                   = try(each.value.postgresql_backup_window, null) #var.postgresql_backup_window
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  create_cloudwatch_log_group     = true

  backup_retention_period = 1
  skip_final_snapshot     = false
  deletion_protection     = false
  #kms_key_id              = module.kms.key_arn
  kms_key_id = try(each.value.kms_key_id_arn, null) #var.kms_key_id_arn

  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  create_monitoring_role                = true
  monitoring_interval                   = 60
  monitoring_role_name                  = local.postgresql_monitoring_role_name
  monitoring_role_use_name_prefix       = false
  monitoring_role_description           = "Description for monitoring role"

  parameters = [
    {
      name  = "autovacuum"
      value = 1
    },
    {
      name  = "client_encoding"
      value = "utf8"
    }
  ]

  # tags = local.tags
  db_option_group_tags = {
    "Sensitive" = "low"
  }
  db_parameter_group_tags = {
    "Sensitive" = "low"
  }
  tags = merge(
    local.common_tags,
    local.postgresql_additional_tags
  )
}





# postgresql Security Group
# Doc here
# https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest

module "postgresql_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"
  for_each = var.postgres_config
  name            = local.postgresql_security_group_name
  description     = "Security group used by postgresql"
  #vpc_id          = module.vpc.vpc_id
  vpc_id = try(each.value.vpc_id, null) #var.vpc_id
  use_name_prefix = false

  egress_rules = try(each.value.postgresql_security_group_egress_rules, null) #var.postgresql_security_group_egress_rules

  ingress_with_cidr_blocks = [
    {
      rule        = "postgresql-tcp"
      #cidr_blocks = module.vpc.vpc_cidr_block
      cidr_blocks = try(each.value.ingress_cidr_block, "") #var.vpc_cidr_block
      name        = local.postgresql_security_group_ingress_rule_name
      description = "postgresql security group"
    },
  ]
  tags = merge(
    local.common_tags,
    local.postgresql_helpers_additional_tags
  )
}
