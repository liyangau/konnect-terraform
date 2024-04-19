output "tf_cp_config" {
  value = module.control-planes.tf_cp.config
}

output "tf_k8s_cp_config" {
  value = module.control-planes.tf_k8s_cp.config
}

output "portal_domain" {
  value = module.dev-portal.portal.default_domain
}