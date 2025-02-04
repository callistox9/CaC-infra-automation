output "security_group_arn" {
  description = "Amazon Resource Name (ARN) of the security group"
  value = {
    for k, v in module.security_group : k => v.security_group_arn
  }
}

output "security_group_id" {
  description = "ID of the security group"
  value = {
    for k, v in module.security_group : k => v.security_group_id
  }
}
