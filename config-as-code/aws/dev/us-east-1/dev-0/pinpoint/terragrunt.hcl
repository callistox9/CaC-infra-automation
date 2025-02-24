
terraform {
  source = "../../../../../../pinpoint"
}

include "root" {
  path = find_in_parent_folders("root-aws.hcl")
}

include "provider" {
  path = find_in_parent_folders("provider-aws.hcl")
}
