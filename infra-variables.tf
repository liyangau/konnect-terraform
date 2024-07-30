locals {
  control_planes = {
    # demo = {
    #   name = "demo"
    #   type = "CLUSTER_TYPE_CONTROL_PLANE"
    #   labels = {
    #     environment = "demo"
    #     team        = "devops"
    #   }
    #   description = "Control plane used by dev team"
    # },
    # staging = {
    #   name = "staging"
    #   type = "CLUSTER_TYPE_CONTROL_PLANE"
    # },
    # home_cluster = {
    #   name        = "k8s-cluster"
    #   type        = "CLUSTER_TYPE_K8S_INGRESS_CONTROLLER"
    #   description = "KIC running on homelabe cluster"
    # },
    dev_au_cloud = {
      name          = "dev-au-cloud"
      type          = "CLUSTER_TYPE_CONTROL_PLANE"
      auth_type     = "pinned_client_certs"
      cloud_gateway = true
      labels = {
        environment = "cloud"
        team        = "devops"
        region      = "au"
      }
      description = "Control plane in AU used by cloud devops team"
    },
  }
  networks = {
    dev_au = {
      allowed_cidr_blocks = [
        "0.0.0.0/0"
      ]
      cidr_block      = "10.10.0.0/16"
      ddos_protection = false
      region          = "ap-southeast-2"
    }
    # dev_sg = {
    #   allowed_cidr_blocks = [
    #     "0.0.0.0/0"
    #   ]
    #   cidr_block      = "10.11.0.0/16"
    #   ddos_protection = false
    #   region          = "ap-southeast-1"
    # }
  }
  cloud_gateways = {
    # dev_au = {
    #   region             = "ap-southeast-2"
    #   custom_domain      = "proxy.fomm.au"
    #   api_access         = "private+public"
    #   control_plane_geo  = "au"
    #   control_plane_name = "dev_au_cloud"
    #   control_plane_id   = module.control-planes.cps["dev_au_cloud"].id
    #   kong_version       = "3.7"
    #   network_id         = module.networks["dev_au"].id
    # }
  }
  transit_gateways = {
    # dev_au = {
    #   name = "Transit Gateway for Cloud Gateway dev_au"
    #   cidr_blocks = ["168.186.0.0/16"]
    #   ram_share_arn = "arn:aws:ram:<region>:<account_id>:resource-share/<resource_id>"
    #   transit_gateway_id = "tgw-<id>"
    #   network_id = module.networks["dev_au"].id
    # }
  }
}
