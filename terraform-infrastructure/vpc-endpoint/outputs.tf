output "endpoints" {
  description = "vpc endpoints"
  value = {
    for k, v in module.vpc-endpoints : k => v.endpoints
  }
}