# TODO - Use modular approach only when multiple resources are being created with similar configurations. Add variables and then remove the defaults. Placce the variables in the infrastructure module.

variable "cognito_pool_configs" {
  description = "cognito_pool_configs"
  type        = any
  default     = {}
}
# variable "cognito_name_suffix" {
#   description = "value for cognito_name_suffix"
#   type = string

  
# }

# variable "mfa" {
#   description = "mfa"
#   type        = string
#   #default     = "OFF"
  
# }

