locals {
  # Automatically load account-level variables
  root_deployments_dir       = get_parent_terragrunt_dir()
  relative_deployment_path   = path_relative_to_include()
  deployment_path_components = compact(split("/", local.relative_deployment_path))
  state_path                 = join("/", slice(local.deployment_path_components, 2, length(local.deployment_path_components)))
  env                        = local.deployment_path_components[0]
  azure_region               = local.deployment_path_components[0]


  possible_config_dirs = [
    for i in range(0, length(local.deployment_path_components) + 1) :
    join("/", concat(
      ["${local.root_deployments_dir}"],
      slice(local.deployment_path_components, 0, i)
    ))
  ]

  possible_config_paths = flatten([
    for dir in local.possible_config_dirs : [
      "${dir}/config.yml",
      "${dir}/config.yaml",
    ]
  ])

  file_configs = [
    for path in local.possible_config_paths :
    yamldecode(file(path)) if fileexists(path)
  ]

  merged_config = merge(local.file_configs...)

  # Azure-specific configurations
  storage_account_name = "ebaztfstate${local.env}"
  container_name       = "terraform-state"
}

# Azure remote state configuration 
# remote_state {
#   backend = "azurerm"
#   generate = {
#     path      = "backend.tf"
#     if_exists = "overwrite"
#   }
#   config = {
#     resource_group_name  = "terraform-state-rg"
#     storage_account_name = local.storage_account_name
#     container_name       = local.container_name
#     key                  = "${local.merged_config.subscription_id}/${local.env}/${local.state_path}/terraform.tfstate"
#   }
# }


generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "azurerm" {
  features {}

  subscription_id = "${local.merged_config.subscription_id}"
  client_id       = "${local.merged_config.client_id}"
  client_secret   = "${local.merged_config.client_secret}"
  tenant_id       = "${local.merged_config.tenant_id}"
  
  # Use environment variables for sensitive data instead if preferred
  # (ARM_SUBSCRIPTION_ID, ARM_CLIENT_ID, etc.)

  default_tags {
    tags = {
      automation     = "true"
      automation_via = "terragrunt"
      owner          = "cloudops"
      environment    = "${local.env}"
    }
  }
}
EOF
}

terraform {
  before_hook "api_spec" {
    commands     = ["init", "apply", "destroy", "plan"]
    execute      = ["cp", "-rf", "${get_repo_root()}/api_spec", "."]
  }

  before_hook "lambdas" {
    commands     = ["init", "apply", "destroy", "plan"]
    execute      = ["cp", "-rf", "${get_repo_root()}/lambdas", "."]
  }
}
