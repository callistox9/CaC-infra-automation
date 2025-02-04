
module "sns_topic" {
  source  = "terraform-aws-modules/sns/aws"

  name  = "simple"

 tags = merge(
   
    local.common_tags,
  )
}
