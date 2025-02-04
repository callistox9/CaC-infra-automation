

# sagemaker domain IAM role and policies
data "aws_iam_policy" "AmazonSageMakerFullAccess" {
  name = "AmazonSageMakerFullAccess"
}

data "aws_iam_policy" "AmazonSageMakerCanvasFullAccess" {
  name = "AmazonSageMakerCanvasFullAccess"
}

data "aws_iam_policy" "AmazonSageMakerCanvasAIServicesAccess" {
  name = "AmazonSageMakerCanvasAIServicesAccess"
}

data "aws_iam_policy" "AmazonSageMakerCanvasDirectDeployAccess" {
  name = "AmazonSageMakerCanvasDirectDeployAccess"
}

data "aws_iam_policy" "AmazonSageMakerCanvasDataPrepFullAccess" {
  name = "AmazonSageMakerCanvasDataPrepFullAccess"
}

data "aws_iam_policy_document" "sagemaker_domain_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["sagemaker.amazonaws.com", "forecast.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "sagemaker_s3_bucket_policy" {
  name        = "sagemaker_s3_bucket_policy"
  path        = "/"
  description = "S3 bucket policy for SageMaker"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:ListAllMyBuckets"
        ]
        Effect = "Allow"
        Resource = "arn:aws:s3:::*"
      },
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket",
          "s3:GetBucketLocation",
          "s3:GetObjectVersion",
          "s3:PutObjectVersionAcl"
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::gisopendata-sandbox/*",
          "arn:aws:s3:::usbuildingcodes-sandbox/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role" "sagemaker_domain_default_execution_role" {
  name               = "sagemaker_domain_exec_role_default_${var.region_short}_${var.environment_name}"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.sagemaker_domain_assume_role_policy.json

  managed_policy_arns = [
    data.aws_iam_policy.AmazonSageMakerFullAccess.arn,
    data.aws_iam_policy.AmazonSageMakerCanvasFullAccess.arn,
    data.aws_iam_policy.AmazonSageMakerCanvasAIServicesAccess.arn,
    data.aws_iam_policy.AmazonSageMakerCanvasDirectDeployAccess.arn,
    data.aws_iam_policy.AmazonSageMakerCanvasDataPrepFullAccess.arn,
    aws_iam_policy.sagemaker_s3_bucket_policy.arn
  ]
}

resource "aws_sagemaker_domain" "sagemaker_domain" {
  for_each = var.sagemaker_domain_config
  domain_name = try(each.value.domain_name, null)

  // IAM or SSO
  auth_mode   = try(each.value.auth_mode, null)
  vpc_id      = try(each.value.vpc_id, null)
  subnet_ids  = try(each.value.subnet_ids, null)

  default_space_settings {
    execution_role = aws_iam_role.sagemaker_domain_default_execution_role.arn
    # try(each.value.execution_role, null)
  }

  default_user_settings {
    execution_role = aws_iam_role.sagemaker_domain_default_execution_role.arn
    # try(each.value.execution_role, null)

    space_storage_settings {
      default_ebs_storage_settings {
        default_ebs_volume_size_in_gb = try(each.value.default_space_min_volume_size, 5)
        maximum_ebs_volume_size_in_gb = try(each.value.default_space_max_volume_size, 100)
      }

    }
  }

  domain_settings {
    security_group_ids = try(each.value.security_group_ids, null)
  }

  # kms_key_id = aws_kms_key.sagemaker_efs_kms_key.arn

  //  'PublicInternetOnly' or 'VpcOnly'
  app_network_access_type = try(each.value.app_network_access_type, null)

  retention_policy {
    home_efs_file_system = try(each.value.efs_retention_policy, null)
  }
}


# resource "aws_sagemaker_user_profile" "default_user" {
#   domain_id         = aws_sagemaker_domain.sagemaker_domain["sagemaker-domain-0"].id
#   user_profile_name = "ebteam"
#   single_sign_on_user_identifier = "UserName"
#   single_sign_on_user_value = "venkat.r@effibuild.co"

#   user_settings {
#     execution_role  = aws_iam_role.sagemaker_domain_default_execution_role.arn
#     security_groups = ["sg-0a3a54224092e4d52"]
#     # var.sagemaker_domain_config.security_group_ids
#   }
# }