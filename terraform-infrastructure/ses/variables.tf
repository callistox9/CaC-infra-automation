# TODO - Use modular approach only when multiple resources are being created with similar configurations. Add variables and then remove the defaults. Placce the variables in the infrastructure module.

variable "ses_configs" {
  description = "vpc_configs"
  type        = any
  default     = {}
}

# variable "domain" {
#   type = string
#   description = "value for domain"

  
# }

# variable "email" {
#   type = string
#   description = "value for email"
  
# }

# variable "zone_id" {
#   type = string
#   description = "value for zone_id" 
  
# }