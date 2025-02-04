variable "postgres_config" {
  description = "postgres_config_files"
  type        = any
  default     = {}
}

# # variable "vpc_private_subnets" {
# #   description = "VPC Private Subnets"
# #   type        = list(string)
# #   default     = []
# # }


# # variable "security_group_id" {
# #   description = "value for security_group_id"
# #   type = list(string)
# #   default = []
  
# # }

# variable "kms_key_id_arn"{
#   description = "value for kam_key_id"
#   type = any
#   default = null
# }

# variable "vpc_id" {
#   description = "value for vpc_id"
#   type = string
#   default = "vpc-09c66f534c904ef58"
  
# }

# variable "ingress_cidr_blocks" {
#   type    = list(string)
#   default = []
# }
# variable "ingress_with_cidr_blocks" {
#   description = "List of ingress rules to create where 'cidr_blocks' is used"
#   type        = list(map(string))
#   default     = []
# }


# variable "vpc_cidr_block" {
#   description = "value for vpc_cidr_block"
#   type = any
#   default = ""
   
# }

# variable "postgresql_db_cluster_name" {
#   description = "postgresql db_cluster_name"
#   type        = string
#   default     = "identifier-postgresql"
# }

# variable "postgresql_engine" {
#   description = "postgresql engine"
#   type        = string
#   default     = "postgres"
# }

# variable "postgresql_engine_version" {
#   description = "postgresql engine_version"
#   type        = string
#   default     = "16"
# }

# variable "postgresql_instance_type" {
#   description = "postgresql instance_type"
#   type        = string
#   default     = "db.t4g.micro"
# }

# variable "postgresql_major_engine_version" {
#   description = "postgresql_major_engine_version"
#   type        = string
#   default     = 16 # value dynamically set, default value doesn't matters
# }

# variable "postgresql_allocated_storage" {
#   description = "postgresql allocated_storage"
#   type        = number
#   default     = 20
# }

# variable "postgresql_max_allocated_storage" {
#   description = "postgresql max_allocated_storage"
#   type        = number
#   default     = 30
# }

# variable "postgresql_db_name" {
#   description = "postgresql db_name"
#   type        = string
#   default     = "db_name"
# }
# variable "postgresql_username" {
#   description = "postgresql username"
#   type        = string
#   default     = "db_username"
# }

# # variable "postgresql_db_subnet_group_name" {
# #   type        = string
# #   description = "An example of a number variable"
# #   default     = "fast-subnet-group"
# # }

# variable "postgresql_maintenance_window" {
#   type        = string
#   description = "An example of a number variable"
#   default     = ""
# }

# variable "postgresql_backup_window" {
#   description = "postgresql backup_window"
#   type        = string
#   default     = ""
# }

# variable "postgresql_software_update_options" {
#   description = "postgresql software_update_options"
#   type        = bool
#   default     = true
# }

# variable "postgresql_zone_awareness_config" {
#   description = "postgresql zone_awareness_config"
#   type        = any
#   default     = {} # default here is reduntant
# }

# variable "postgresql_auto_tune_options" {
#   description = "postgresql auto_tune_options"
#   type        = any
#   default     = {} # default here is reduntant
# }


# # Open Search Security Group Varaibales

# variable "postgresql_security_group_name" {
#   description = "Sg Name"
#   type        = string
#   default     = "postgresql-security-group"
# }


# variable "postgresql_security_group_vpc_id" {
#   description = "vpc_id of the postgresql"
#   type        = string
#   default     = null
# }

# variable "postgresql_security_group_egress_rules" {
#   description = "Egress Rules"
#   type        = list(string)
#   default     = ["all-all"]
# }
