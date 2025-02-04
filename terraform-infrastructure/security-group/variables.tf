variable "security_group_configs" {
  description = "security_group_configs"
  type        = any
  default     = {}
}

# variable "security_group_name" {
#   description = "Sg Name"
#   type        = string
#   default     = "opensearch-security-group"
# }


# variable "security_group_vpc_id" {
#   description = "vpc_id of the opensearch"
#   type        = string
#   default     = null
# }

# variable "security_group_egress_rules" {
#   description = "Egress Rules"
#   type        = list(string)
#   default     = ["all-all"]
# }
