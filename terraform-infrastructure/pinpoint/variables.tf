# TODO - Use modular approach only when multiple resources are being created with similar configurations. Add variables and then remove the defaults. Placce the variables in the infrastructure module.

variable "pinpoint_configs" {
  description = "vpc_configs"
  type        = any
  default     = {}
}


variable "name" {
  description = "The name of the Pinpoint project."
  type        = string
  default     = "EffibuildPinpointProject"
}

variable "apns" {
  description = "APNs configuration."
  type        = map(any)
  default     = null
}

variable "apns_sandbox" {
  description = "APNs Sandbox configuration."
  type        = map(any)
  default     = null
}

variable "apns_voip" {
  description = "APNs VoIP configuration."
  type        = map(any)
  default     = null
}

variable "apns_voip_sandbox" {
  description = "APNs VoIP Sandbox configuration."
  type        = map(any)
  default     = null
}

variable "assume_role_identifiers" {
  description = "Configuration for roles to assume."
  type        = list(string)
  default     = []
}

variable "baidu" {
  description = "Baidu Cloud Push configuration."
  type        = map(any)
  default     = null
}

variable "email" {
  description = "Email configuration."
  type        = object({
    from_address = string
  })
  default = {
    from_address = "dev_support@effibuild.co"
  }
}

variable "sms" {
  description = "SMS configuration."
  type        = map(any)
  default     = null
}
