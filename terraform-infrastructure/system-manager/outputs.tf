output "ssm_parameter_names" {
  description = "The names of the SSM parameters created"
  value       = { for k, v in aws_ssm_parameter.system_manager_param_store : k => v.name }
}

output "ssm_parameter_arns" {
  description = "The ARNs of the SSM parameters created"
  value       = { for k, v in aws_ssm_parameter.system_manager_param_store : k => v.arn }
}

output "ssm_parameter_ids" {
  description = "The IDs of the SSM parameters created"
  value       = { for k, v in aws_ssm_parameter.system_manager_param_store : k => v.id }
}

output "ssm_parameter_types" {
  description = "The types of the SSM parameters created"
  value       = { for k, v in aws_ssm_parameter.system_manager_param_store : k => v.type }
}

output "ssm_parameter_versions" {
  description = "The versions of the SSM parameters created"
  value       = { for k, v in aws_ssm_parameter.system_manager_param_store : k => v.version }
}

output "ssm_parameter_key_ids" {
  description = "The KMS key IDs used to encrypt the SSM parameters"
  value       = { for k, v in aws_ssm_parameter.system_manager_param_store : k => v.key_id if v.type == "SecureString" }
}
