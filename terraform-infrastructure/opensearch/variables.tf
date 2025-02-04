
variable "opensearch_configs" {
  description = "vpc_configs"
  type        = any
  default     = {}
}


# variable "kms_key_id_arn"{
#   description = "value for kam_key_id"
#   type = any
#   default = null
# }
# variable "cloudwatch_log_group_arn"{ 
#   description = "value for cloudwatch_log_group_arn"
#   type = any
#   default = null

# }
# variable "subnet_ids" {
#   description = "value for subnet_ids"
#   type = list
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






variable "opensearch_instance_type" {
  description = "opensearch instance_type"
  type        = string
  default     = ""
}

# variable "opensearch_is_t2_or_t3_instance_type" {
#   description = "opensearch_is_t2_or_t3_instance_type"
#   type        = bool
#   default     = true # value dynamically set, default value doesn't matters
# }

# variable "opensearch_ebs_configurations" {
#   description = "opensearch opensearch_ebs_configurations"
#   type        = any
#   default = {
#     ebs_enabled = true
#     iops        = 3000
#     throughput  = 125
#     volume_type = "gp3"
#     volume_size = 20
#   }
# }

# variable "opensearch_encrypt_at_rest" {
#   description = "opensearch encrypt_at_rest"
#   type        = bool
#   default     = true
# }

# variable "opensearch_engine_version" {
#   description = "opensearch engine_version"
#   type        = string
#   default     = "OpenSearch_2.13"
# }

variable "opensearch_data_node_instance_count" {
  type        = number
  description = "An example of a number variable"
  default     = 1
}

# variable "opensearch_availability_zone_count" {
#   type        = number
#   description = "An example of a number variable"
#   default     = 1
# }

# variable "opensearch_dedicated_master_enabled" {
#   description = "opensearch dedicated_master_enabled"
#   type        = bool
#   default     = false
# }

# variable "opensearch_software_update_options" {
#   description = "opensearch software_update_options"
#   type        = bool
#   default     = true
# }

# variable "opensearch_zone_awareness_config" {
#   description = "opensearch zone_awareness_config"
#   type        = any
#   default     = {} # default here is reduntant
# }

# variable "opensearch_auto_tune_options" {
#   description = "opensearch auto_tune_options"
#   type        = any
#   default     = {} # default here is reduntant
# }


# variable "opensearch_security_group_name" {
#   description = "Sg Name"
#   type        = string
#   default     = "opensearch-security-group"
# }


# variable "opensearch_security_group_vpc_id" {
#   description = "vpc_id of the opensearch"
#   type        = string
#   default     = null
# }

# variable "opensearch_security_group_egress_rules" {
#   description = "Egress Rules"
#   type        = list(string)
#   default     = ["all-all"]
# }

# variable "ingress_cidr_blocks" {
#   type    = list(string)
#   default = []
# }
