variable "documentdb_configs" {
  description = "documentdb config"
  type        = any
  default     = {}
}
# }
# # variable "vpc_private_subnets" {
# #   description = "VPC Private Subnets"
# #   type        = list(string)
# #   default     = []
# # }


# # variable "kms_key_id_arn"{
# #   description = "value for kam_key_id"
# #   type = any
# #   default = null
# # }

# # variable "vpc_id" {
# #   description = "value for vpc_id"
# #   type = string
# #   default = null
  
# # }
# variable "ingress_cidr_blocks" {
#   type    = string
#   default = ""
# }

# # variable "vpc_cidr_block" {
# #   description = "value for vpc_cidr_block"
# #   type = string
# #   default = null
  
# # }


# variable "security_group_id" {
#   description = "value for security_group_id"
#   type = string
#   default = null
  
# }

# variable "documentdb_zone_id" {
#   type        = string
#   default     = ""
#   description = "Route53 parent zone ID. If provided (not empty), the module will create sub-domain DNS records for the DocumentDB master and replicas"
# }

# variable "documentdb_allowed_cidr_blocks" {
#   type        = list(string)
#   default     = []
#   description = "List of CIDR blocks to be allowed to connect to the DocumentDB cluster"
# }

# variable "documentdb_instance_class" {
#   type        = string
#   default     = "db.t3.medium"
#   description = "The instance class to use. For more details, see https://docs.aws.amazon.com/documentdb/latest/developerguide/db-instance-classes.html#db-instance-class-specs"
# }

# variable "documentdb_cluster_size" {
#   type        = number
#   default     = 1
#   description = "Number of DB instances to create in the cluster"
# }

# variable "documentdb_snapshot_identifier" {
#   type        = string
#   default     = ""
#   description = "Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot"
# }

# variable "documentdb_port" {
#   type        = number
#   default     = 27017
#   description = "DocumentDB port"
# }

# variable "documentdb_master_username" {
#   type        = string
#   default     = "admin1"
#   description = "(Required unless a snapshot_identifier is provided) Username for the master DB user"
# }

# variable "documentdb_master_password" {
#   type        = string
#   default     = ""
#   description = "(Required unless a snapshot_identifier is provided) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Please refer to the DocumentDB Naming Constraints"
# }

# variable "documentdb_retention_period" {
#   type        = number
#   default     = 5
#   description = "Number of days to retain backups for"
# }

# variable "documentdb_preferred_backup_window" {
#   type        = string
#   default     = "07:00-09:00"
#   description = "Daily time range during which the backups happen"
# }

# variable "documentdb_preferred_maintenance_window" {
#   type        = string
#   default     = "Mon:22:00-Mon:23:00"
#   description = "The window to perform maintenance in. Syntax: `ddd:hh24:mi-ddd:hh24:mi`."
# }

# variable "documentdb_cluster_parameters" {
#   type = list(object({
#     apply_method = string
#     name         = string
#     value        = string
#   }))
#   default     = []
#   description = "List of DB parameters to apply"
# }

# variable "documentdb_cluster_family" {
#   type        = string
#   default     = "docdb5.0"
#   description = "The family of the DocumentDB cluster parameter group. For more details, see https://docs.aws.amazon.com/documentdb/latest/developerguide/db-cluster-parameter-group-create.html"
# }

# variable "documentdb_engine" {
#   type        = string
#   default     = "docdb"
#   description = "The name of the database engine to be used for this DB cluster. Defaults to `docdb`. Valid values: `docdb`"
# }

# variable "documentdb_engine_version" {
#   type        = string
#   default     = "5.0.0"
#   description = "The version number of the database engine to use"
# }

# variable "documentdb_storage_encrypted" {
#   type        = bool
#   description = "Specifies whether the DB cluster is encrypted"
#   default     = true
# }

# variable "documentdb_storage_type" {
#   type        = string
#   description = "The storage type to associate with the DB cluster. Valid values: standard, iopt1"
#   default     = "standard"

#   validation {
#     condition     = contains(["standard", "iopt1"], var.documentdb_storage_type)
#     error_message = "Error: documentdb_storage_type value must be one of two options - 'standard' or 'iopt1'."
#   }
# }

# variable "documentdb_kms_key_id" {
#   type        = string
#   description = "The ARN for the KMS encryption key. When specifying `kms_key_id`, `storage_encrypted` needs to be set to `true`"
#   default     = ""
# }

# variable "documentdb_skip_final_snapshot" {
#   type        = bool
#   description = "Determines whether a final DB snapshot is created before the DB cluster is deleted"
#   default     = true
# }

# variable "documentdb_apply_immediately" {
#   type        = bool
#   description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window"
#   default     = true
# }

# variable "documentdb_auto_minor_version_upgrade" {
#   type        = bool
#   description = "Specifies whether any minor engine upgrades will be applied automatically to the DB instance during the maintenance window or not"
#   default     = true
# }

# variable "documentdb_enabled_cloudwatch_logs_exports" {
#   type        = list(string)
#   description = "List of log types to export to cloudwatch. The following log types are supported: `audit`, `profiler`"
#   default     = []
# }

# variable "documentdb_cluster_dns_name" {
#   type        = string
#   description = "Name of the cluster CNAME record to create in the parent DNS zone specified by `zone_id`. If left empty, the name will be auto-asigned using the format `master.var.name`"
#   default     = ""
# }

# variable "documentdb_reader_dns_name" {
#   type        = string
#   description = "Name of the reader endpoint CNAME record to create in the parent DNS zone specified by `zone_id`. If left empty, the name will be auto-asigned using the format `replicas.var.name`"
#   default     = ""
# }

# variable "documentdb_ssm_parameter_enabled" {
#   type        = bool
#   description = "Whether an SSM parameter store value is created to store the database password."
#   default     = false
# }

# variable "documentdb_security_group_egress_rules" {
#   description = "Egress Rules"
#   type        = list(string)
#   default     = ["all-all"]
# }