locals {
  # Automatically load account-level variables
  root_deployments_dir       = get_parent_terragrunt_dir()
  relative_deployment_path   = path_relative_to_include()
  deployment_path_components = compact(split("/", local.relative_deployment_path))
  
  # Adjust slice indices based on your folder structure
  state_path = join("/", slice(local.deployment_path_components, 3, length(local.deployment_path_components)))
  
  # Extract environment and region from config or folder structure
  env = local.merged_config.environment  # Get environment from YAML config
  azure_region = local.merged_config.azure_region  # Get region from YAML config

  # Load YAML configs (unchanged)
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
}
