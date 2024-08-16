resource "konnect_cloud_gateway_configuration" "cgw_dp" {
  api_access = var.api_access
  control_plane_geo = var.control_plane_geo
  control_plane_id = var.control_plane_id
  version = var.kong_version
  dataplane_groups = [
    {
      provider = "aws"
      region = var.region
      autoscale = {
        # configuration_data_plane_group_autoscale_autopilot = {
        #   kind     = "autopilot"
        #   base_rps = 10
        #   max_rps  = 100
        # }

        configuration_data_plane_group_autoscale_static = {
          kind     = "static"
          instance_type = "medium"
          requested_instances = 1
        }
      }
      cloud_gateway_network_id = var.network_id
    },
  ]
}