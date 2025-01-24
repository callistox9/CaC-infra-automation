locals {
  ec2_additional_tags = {
    customer_critical = "true"
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  for_each = var.ec2_configs
  name = "single-instance"

  instance_type          = try(each.value.instance_type, "t2.micro")
  key_name               = try(each.value.key_name, "user1")
  monitoring             = try(each.value.monitoring, false)
  vpc_security_group_ids = try(each.value.vpc_security_group_ids, [])
  subnet_id              = try(each.value.subnet_id, "subnet-eddcdzz4")

tags = merge(
  local.common_tags,
  local.ec2_additional_tags
)
}
