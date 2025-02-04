output "secret_arn" {
  description = "The ARN of the secret"
  value = {
    for k, v in module.secrets_manager : k => v.secret_arn
  }
}

output "secret_id" {
  description = "The ID of the secret"
  value = {
    for k, v in module.secrets_manager : k => v.secret_id
  }
}

output "secret_replica" {
  description = "The replica region details of the secret"
  value = {
    for k, v in module.secrets_manager : k => v.secret_replica
  }
}

output "secret_version_id" {
  description = "The version ID of the secret"
  value = {
    for k, v in module.secrets_manager : k => v.secret_version_id
  }
}
