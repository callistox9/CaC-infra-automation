
# Doc -- https://chatgpt.com/share/6717378e-1544-8013-b4be-621efe26f5fe Pinpoint for sms phonepool with terraform
module "pinpoint" {
  source  = "genstackio/pinpoint/aws"
  version = "0.3.0"
  for_each = var.pinpoint_configs
  name = try(each.value.pinpoint_project_name, null)

  sms = {
    enabled            = true
  }

}

