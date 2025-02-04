variable "redis_config" {
  description = "vpc_configs"
  type        = any
  default     = {}
}


# variable "ingress_with_cidr_blocks" {
#   description = "value for ingress_with_cidr_blocks"
#   type = list
#   default = []
  
# }


# variable "subnet_ids" {
#   description = "value for subnet_ids"
#   type = list
#   default = []
  
# }

# variable "kms_key_id_arn"{
#   description = "value for kam_key_id"
#   type = any
#   default = null
# }

# variable "vpc_id" {
#   description = "value for vpc_id"
#   type = string
#   default = null
  
# }

# variable "vpc_cidr_block" {
#   description = "value for vpc_cidr_block"
#   type = string
#   default = ""
  
# }


# variable "security_group_id" {
#   description = "value for security_group_id"
#   type = string
#   default = null
  
# }


# variable "redis_engine" {
#   description = "Redis Engine"
#   type        = string
#   default     = "redis"
# }

# variable "redis_cache_name" {
#   description = "redis cache_name"
#   type        = string
#   default     = "fast-cache"
# }

# variable "redis_major_engine_version" {
#   description = "redis major_engine_version"
#   type        = string
#   default     = "7"
# }

# variable "redis_daily_snapshot_time" {
#   description = "redis daily_snapshot_time"
#   type        = string
#   default     = "12:00"
# }

# variable "redis_snapshot_retention_days" {
#   type        = number
#   description = "An example of a number variable"
#   default     = 7
# }

# variable "redis_kms_arn" {
#   description = "ARN of the customer managed key for encrypting the data at rest. If no KMS key is provided, a default service key is used."
#   type        = string
#   default     = null
# }


# # Redis Security Group Varaibales

# variable "security_group_configs" {
#   description = "security_group_configs"
#   type        = any
#   default     = {}
# }

# variable "redis_security_group_name" {
#   description = "Sg Name"
#   type        = string
#   default     = "redis-security-group"
# }


# variable "redis_security_group_vpc_id" {
#   description = "vpc_id of the redis"
#   type        = string
#   default     = null
# }

# variable "redis_security_group_egress_rules" {
#   description = "Egress Rules"
#   type        = list(string)
#   default     = ["all-all"]
# }
