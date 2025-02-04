variable "sm_config" {
  type = any
  default = {}
  description = "Secrets manager configurations"
  
}

# variable "sm_name_suffix" {
#   type = string
#   description = "name suffix of secret manager"

  
# }
# variable "policy_sid" {
#   type = string
#   description = "sid value of policy os the secret manager"
  
# }

# variable "user_actions" {
#   type = list(string)
#   description = "Allowed user actions for the secret manager"
  
# }

# variable "user_actions_resources" {
#   type = string
#   description = "Resources on which resource action is allowed"
# }