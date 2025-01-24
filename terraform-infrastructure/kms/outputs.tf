# Output the aliases associated with the KMS key
output "kms_aliases" {
  description = "List of aliases associated with the KMS key"
  value = {
    for k, v in module.kms : k => v.aliases
  }
}

# Output the external key expiration model
output "kms_external_key_expiration_model" {
  description = "The expiration model of the external KMS key"
  value = {
    for k, v in module.kms : k => v.external_key_expiration_model
  }
}

# Output the external key state
output "kms_external_key_state" {
  description = "The state of the external KMS key"
  value = {
    for k, v in module.kms : k => v.external_key_state
  }
}

# Output the external key usage
output "kms_external_key_usage" {
  description = "The usage of the external KMS key"
  value = {
    for k, v in module.kms : k => v.external_key_usage
  }
}

# Output the grants associated with the KMS key
output "kms_grants" {
  description = "The grants associated with the KMS key"
  value = {
    for k, v in module.kms : k => v.grants
  }
}

# Output the ARN of the KMS key
output "kms_key_arn" {
  description = "The ARN of the KMS key"
  value = {
    for k, v in module.kms : k => v.key_arn
  }
}

# Output the ID of the KMS key
output "kms_key_id" {
  description = "The ID of the KMS key"
  value = {
    for k, v in module.kms : k => v.key_id
  }
}

# Output the key policy associated with the KMS key
output "kms_key_policy" {
  description = "The key policy associated with the KMS key"
  value = {
    for k, v in module.kms : k => v.key_policy
  }
}




# output "kms_key_arn" {
#   description = "The Amazon Resource Name (ARN) of the key"
#   value       = module.kms.key_arn
# }

# output "kms_key_id" {
#   description = "The globally unique identifier for the key"
#   value       = module.kms.key_id
# }

# output "kms_key_policy" {
#   description = "The IAM resource policy set on the key"
#   value       = module.kms.key_policy
# }

# output "kms_external_key_expiration_model" {
#   description = "Whether the key material expires. Empty when pending key material import, otherwise `KEY_MATERIAL_EXPIRES` or `KEY_MATERIAL_DOES_NOT_EXPIRE`"
#   value       = module.kms.external_key_expiration_model
# }

# output "kms_external_key_state" {
#   description = "The state of the CMK"
#   value       = module.kms.external_key_state
# }

# output "kms_external_key_usage" {
#   description = "The cryptographic operations for which you can use the CMK"
#   value       = module.kms.external_key_usage
# }

# output "kms_aliases" {
#   description = "A map of aliases created and their attributes"
#   value       = module.kms.aliases
# }

# output "kms_grants" {
#   description = "A map of grants created and their attributes"
#   value       = module.kms.grants
# }
