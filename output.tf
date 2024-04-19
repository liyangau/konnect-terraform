output "dev_config" {
  value = module.control-planes.dev.config
}

output "home_cluster_config" {
  value = module.control-planes.home_cluster.config
}

output "portal_domain" {
  value = module.dev-portal.portal.default_domain
}