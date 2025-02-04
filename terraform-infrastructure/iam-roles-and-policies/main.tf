locals {
  iam_additional_tags = {
    customer_critical = "true"
  }
}


# effibuild security group
# Doc here
# https://registry.terraform.io/modules/terraform-aws-modules/iam/aws/latest


module "iam_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "5.44.0"

  for_each = var.iam_roles_and_policies_configs

  create_role = true



  trusted_role_arns = try(each.value.trusted_role_arns, null)
  trusted_role_services = try(each.value.trusted_role_services, null)


  role_name         = try("${var.region_short}-${var.environment_name}-${each.value.role_name_suffix}", null)
  role_requires_mfa = false

  custom_role_policy_arns = try(each.value.policy_arns, null)
  # number_of_custom_role_policy_arns = 1

# TODO use this flag attach_inline_policy to attach policy or not
  inline_policy_statements = try(each.value.inline_policy_statements, null)
  # inline_policy_statements = [
  #   {
  #     sid = "AllowECRPushPull"
  #     actions = [
  #       "ecr:GetAuthorizationToken",
  #       "ecr:BatchGetImage",
  #       "ecr:GetDownloadUrlForLayer",
  #       "ecr:BatchCheckLayerAvailability",
  #       "ecr:DescribeImages",
  #       "ecr:DescribeRepositories",
  #       "ecr:GetDownloadUrlForLayer",
  #       "ecr:ListImages",
  #       "ecr:PutImage",
  #       "ecr:InitiateLayerUpload",
  #       "ecr:UploadLayerPart",
  #       "ecr:CompleteLayerUpload"
  #     ]
  #     effect    = "Allow"
  #     resources = ["*"]
  #   }
  # ]


  tags = merge(
    local.common_tags,
    local.iam_additional_tags
  )

}

# module "iam_policy" {
#   source = "terraform-aws-modules/iam/aws//modules/iam-policy"


#   for_each      = var.iam_roles_and_policies_configs
#   create_policy = try(each.value.attach_inline_policy, null)

#   name        = try("${var.region_short}-${var.environment_name}-${each.value.inline_policy_name_suffix}", null)
#   path        = "/"
#   description = "My example policy"

#   policy = try(each.value.inline_policy_json, null)

#   tags = merge(
#     local.common_tags,
#     local.iam_additional_tags
#   )
# }
#   policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": [
#         "ec2:Describe*"
#       ],
#       "Effect": "Allow",
#       "Resource": "*"
#     }
#   ]
# }
# EOF
# }






