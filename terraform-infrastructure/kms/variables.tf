
variable "kms_configs" {
  description = "kms_configs"
  type        = any
  default     = {}
  
}

# variable "kms_enable_key_rotation" {
#   description = "kms enable_key_rotation ?"
#   type        = bool
#   default     = true
# }
# # kms Name
# variable "kms_key_usage" {
#   description = "kms "
#   type        = string
#   default     = "ENCRYPT_DECRYPT"
# }

# variable "kms_key_users" {
#   description = "kms Key Users"
#   type        = list(string)
#   default     = ["arn:aws:iam::891376921657:root"]
# }

# variable "kms_aliases" {
#   description = "kms aliases"
#   type        = list(string)
#   default     = ["effibuild/lambda", "effibuild/s3", "effibuild/elasticfilesystem", "effibuild/es", "effibuild/ebs", "effibuild/codecommit", "effibuild/cloud9", "effibuild/sns", "effibuild/secretsmanager", "effibuild/acm", "effibuild/rds"]
# }

# variable "kms_aliases_use_name_prefix" {
#   description = "kms aliases_use_name_prefix ?"
#   type        = bool
#   default     = false
# }

# variable "kms_multi_region" {
#   description = "kms multi_region ?"
#   type        = bool
#   default     = true
# }

# variable "kms_enable_default_policy" {
#   description = "kms enable_default_policy ?"
#   type        = bool
#   default     = true
# }

# variable "kms_is_enabled" {
#   description = "kms is_enabled ?"
#   type        = bool
#   default     = true
# }

# variable "kms_create_external" {
#   description = "kms create_external ?"
#   type        = bool
#   default     = false
# }
