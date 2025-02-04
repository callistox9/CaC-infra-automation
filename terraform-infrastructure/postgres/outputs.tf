

output "db_instance_addresses" {
  description = "The addresses of the RDS instances"
  value = {
    for k, v in module.postgresql_db : k => v.db_instance_address
  }
}

output "db_instance_arns" {
  description = "The ARNs of the RDS instances"
  value = {
    for k, v in module.postgresql_db : k => v.db_instance_arn
  }
}

output "db_instance_availability_zones" {
  description = "The availability zones of the RDS instances"
  value = {
    for k, v in module.postgresql_db : k => v.db_instance_availability_zone
  }
}

output "db_instance_endpoints" {
  description = "The connection endpoints of the RDS instances"
  value = {
    for k, v in module.postgresql_db : k => v.db_instance_endpoint
  }
}

output "db_instance_engines" {
  description = "The database engines of the RDS instances"
  value = {
    for k, v in module.postgresql_db : k => v.db_instance_engine
  }
}

output "db_instance_engine_versions_actual" {
  description = "The running versions of the databases"
  value = {
    for k, v in module.postgresql_db : k => v.db_instance_engine_version_actual
  }
}

output "db_instance_hosted_zone_ids" {
  description = "The canonical hosted zone IDs of the RDS instances"
  value = {
    for k, v in module.postgresql_db : k => v.db_instance_hosted_zone_id
  }
}

output "db_instance_identifiers" {
  description = "The identifiers of the RDS instances"
  value = {
    for k, v in module.postgresql_db : k => v.db_instance_identifier
  }
}

output "db_instance_resource_ids" {
  description = "The resource IDs of the RDS instances"
  value = {
    for k, v in module.postgresql_db : k => v.db_instance_resource_id
  }
}

output "db_instance_statuses" {
  description = "The statuses of the RDS instances"
  value = {
    for k, v in module.postgresql_db : k => v.db_instance_status
  }
}

output "db_instance_names" {
  description = "The database names of the RDS instances"
  value = {
    for k, v in module.postgresql_db : k => v.db_instance_name
  }
}

output "db_instance_usernames" {
  description = "The master usernames for the databases"
  value = {
    for k, v in module.postgresql_db : k => v.db_instance_username
  }
  sensitive = true
}

output "db_instance_ports" {
  description = "The database ports of the RDS instances"
  value = {
    for k, v in module.postgresql_db : k => v.db_instance_port
  }
}
output "db_subnet_group_ids" {
  description = "The subnet group names of the RDS instances"
  value = {
    for k, v in module.postgresql_db : k => v.db_subnet_group_id
  }
}

output "db_subnet_group_arns" {
  description = "The ARNs of the subnet groups of the RDS instances"
  value = {
    for k, v in module.postgresql_db : k => v.db_subnet_group_arn
  }
}

output "db_parameter_group_ids" {
  description = "The parameter group IDs of the RDS instances"
  value = {
    for k, v in module.postgresql_db : k => v.db_parameter_group_id
  }
}

output "db_parameter_group_arns" {
  description = "The ARNs of the parameter groups of the RDS instances"
  value = {
    for k, v in module.postgresql_db : k => v.db_parameter_group_arn
  }
}

output "db_enhanced_monitoring_iam_role_arns" {
  description = "The ARNs specifying the monitoring roles of the RDS instances"
  value = {
    for k, v in module.postgresql_db : k => v.enhanced_monitoring_iam_role_arn
  }
}

output "db_instance_cloudwatch_log_groups_map" {
  description = "Maps of CloudWatch log groups created and their attributes for the RDS instances"
  value = {
    for k, v in module.postgresql_db : k => v.db_instance_cloudwatch_log_groups
  }
}

output "db_instance_master_user_secret_arns" {
  description = "The ARNs of the master user secrets (Only available when manage_master_user_password is set to true)"
  value = {
    for k, v in module.postgresql_db : k => v.db_instance_master_user_secret_arn
  }
}

output "db_instance_secretsmanager_secret_rotation_enabled_flags" {
  description = "Flags indicating whether automatic rotation is enabled for the secrets"
  value = {
    for k, v in module.postgresql_db : k => v.db_instance_secretsmanager_secret_rotation_enabled
  }
}




# output "postgresql_instance_address" {
#   description = "The address of the RDS instance"
#   value       = module.postgresql_db.db_instance_address
# }

# output "postgresql_instance_arn" {
#   description = "The ARN of the RDS instance"
#   value       = module.postgresql_db.db_instance_arn
# }

# output "postgresql_instance_availability_zone" {
#   description = "The availability zone of the RDS instance"
#   value       = module.postgresql_db.db_instance_availability_zone
# }

# output "postgresql_instance_endpoint" {
#   description = "The connection endpoint"
#   value       = module.postgresql_db.db_instance_endpoint
# }

# output "postgresql_instance_engine" {
#   description = "The database engine"
#   value       = module.postgresql_db.db_instance_engine
# }

# output "postgresql_instance_engine_version_actual" {
#   description = "The running version of the database"
#   value       = module.postgresql_db.db_instance_engine_version_actual
# }

# output "postgresql_instance_hosted_zone_id" {
#   description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
#   value       = module.postgresql_db.db_instance_hosted_zone_id
# }

# output "postgresql_instance_identifier" {
#   description = "The RDS instance identifier"
#   value       = module.postgresql_db.db_instance_identifier
# }

# output "postgresql_instance_resource_id" {
#   description = "The RDS Resource ID of this instance"
#   value       = module.postgresql_db.db_instance_resource_id
# }

# output "postgresql_instance_status" {
#   description = "The RDS instance status"
#   value       = module.postgresql_db.db_instance_status
# }

# output "postgresql_instance_name" {
#   description = "The database name"
#   value       = module.postgresql_db.db_instance_name
# }

# output "postgresql_instance_username" {
#   description = "The master username for the database"
#   value       = module.postgresql_db.db_instance_username
#   sensitive   = true
# }

# output "postgresql_instance_port" {
#   description = "The database port"
#   value       = module.postgresql_db.db_instance_port
# }

# output "postgresql_subnet_group_id" {
#   description = "The db subnet group name"
#   value       = module.postgresql_db.db_subnet_group_id
# }

# output "postgresql_subnet_group_arn" {
#   description = "The ARN of the db subnet group"
#   value       = module.postgresql_db.db_subnet_group_arn
# }

# output "postgresql_parameter_group_id" {
#   description = "The db parameter group id"
#   value       = module.postgresql_db.db_parameter_group_id
# }

# output "postgresql_parameter_group_arn" {
#   description = "The ARN of the db parameter group"
#   value       = module.postgresql_db.db_parameter_group_arn
# }

# output "postgresql_enhanced_monitoring_iam_role_arn" {
#   description = "The Amazon Resource Name (ARN) specifying the monitoring role"
#   value       = module.postgresql_db.enhanced_monitoring_iam_role_arn
# }

# output "postgresql_instance_cloudwatch_log_groups" {
#   description = "Map of CloudWatch log groups created and their attributes"
#   value       = module.postgresql_db.db_instance_cloudwatch_log_groups
# }

# output "postgresql_instance_master_user_secret_arn" {
#   description = "The ARN of the master user secret (Only available when manage_master_user_password is set to true)"
#   value       = module.postgresql_db.db_instance_master_user_secret_arn
# }

# output "postgresql_instance_secretsmanager_secret_rotation_enabled" {
#   description = "Specifies whether automatic rotation is enabled for the secret"
#   value       = module.postgresql_db.db_instance_secretsmanager_secret_rotation_enabled
# }








# output "postgresql_instance_address" {
#   description = "The address of the RDS instance"
#   value       = module.postgresql_db.db_instance_address
# }

# output "postgresql_instance_arn" {
#   description = "The ARN of the RDS instance"
#   value       = module.postgresql_db.db_instance_arn
# }

# output "postgresql_instance_availability_zone" {
#   description = "The availability zone of the RDS instance"
#   value       = module.postgresql_db.db_instance_availability_zone
# }

# output "postgresql_instance_endpoint" {
#   description = "The connection endpoint"
#   value       = module.postgresql_db.db_instance_endpoint
# }

# output "postgresql_instance_engine" {
#   description = "The database engine"
#   value       = module.postgresql_db.db_instance_engine
# }

# output "postgresql_instance_engine_version_actual" {
#   description = "The running version of the database"
#   value       = module.postgresql_db.db_instance_engine_version_actual
# }

# output "postgresql_instance_hosted_zone_id" {
#   description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
#   value       = module.postgresql_db.db_instance_hosted_zone_id
# }

# output "postgresql_instance_identifier" {
#   description = "The RDS instance identifier"
#   value       = module.postgresql_db.db_instance_identifier
# }

# output "postgresql_instance_resource_id" {
#   description = "The RDS Resource ID of this instance"
#   value       = module.postgresql_db.db_instance_resource_id
# }

# output "postgresql_instance_status" {
#   description = "The RDS instance status"
#   value       = module.postgresql_db.db_instance_status
# }

# output "postgresql_instance_name" {
#   description = "The database name"
#   value       = module.postgresql_db.db_instance_name
# }

# output "postgresql_instance_username" {
#   description = "The master username for the database"
#   value       = module.postgresql_db.db_instance_username
#   sensitive   = true
# }

# output "postgresql_instance_port" {
#   description = "The database port"
#   value       = module.postgresql_db.db_instance_port
# }

# output "postgresql_subnet_group_id" {
#   description = "The db subnet group name"
#   value       = module.postgresql_db.db_subnet_group_id
# }

# output "postgresql_subnet_group_arn" {
#   description = "The ARN of the db subnet group"
#   value       = module.postgresql_db.db_subnet_group_arn
# }

# output "postgresql_parameter_group_id" {
#   description = "The db parameter group id"
#   value       = module.postgresql_db.db_parameter_group_id
# }

# output "postgresql_parameter_group_arn" {
#   description = "The ARN of the db parameter group"
#   value       = module.postgresql_db.db_parameter_group_arn
# }

# output "postgresql_enhanced_monitoring_iam_role_arn" {
#   description = "The Amazon Resource Name (ARN) specifying the monitoring role"
#   value       = module.postgresql_db.enhanced_monitoring_iam_role_arn
# }

# output "postgresql_instance_cloudwatch_log_groups" {
#   description = "Map of CloudWatch log groups created and their attributes"
#   value       = module.postgresql_db.db_instance_cloudwatch_log_groups
# }

# output "postgresql_instance_master_user_secret_arn" {
#   description = "The ARN of the master user secret (Only available when manage_master_user_password is set to true)"
#   value       = module.postgresql_db.db_instance_master_user_secret_arn
# }

# output "postgresql_instance_secretsmanager_secret_rotation_enabled" {
#   description = "Specifies whether automatic rotation is enabled for the secret"
#   value       = module.postgresql_db.db_instance_secretsmanager_secret_rotation_enabled
# }
