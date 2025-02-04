variable "sm_config" {
  description = "ssm config"
  type        = any
  default     = {}
  
}

# variable "tier" {
#   description = "type of the tier of the parameter"
#   type = string
#   #Standard, Advanced, and Intelligent-Tiering
# }

# variable "data_type" {
#   type = string
#   description = "value for data_type"
#   default = null
  
# }
# variable "secret_token_name" {
#   type = string
#   description = "value for secret_token"
  
# }

# variable "value" {
#   description = "value for secret_token_value"
#   type = string

  
# }

# variable "list_parameter" {
#   description = "value for list_parameter"
#   type = list(string)

  
# }

# variable "ignore_value_changes" {
#   type = bool
#   description = "bool of ignaore changes"
  
# }