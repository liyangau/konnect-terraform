resource "konnect_api_product" "httpbin" {
  name        = "HTTPBin"
  description = "This is a description for my API Product"

  portal_ids = [
    data.konnect_portal_list.my_portallist.data[0].id
  ]
}

resource "konnect_api_product_version" "httpbin_v1" {
  api_product_id = konnect_api_product.httpbin.id
  name           = "v1"
  gateway_service = {
    control_plane_id = var.control_plane_dev.id
    id               = var.gateway_services_httpbin.id
  }
}

resource "konnect_api_product" "echo" {
  name        = "Echo"
  description = "This is a description for my API Product"

  portal_ids = [
    data.konnect_portal_list.my_portallist.data[0].id
  ]
}

resource "konnect_api_product_version" "echo_v1" {
  api_product_id = konnect_api_product.echo.id
  name           = "v1"
  gateway_service = {
    control_plane_id = var.control_plane_dev.id
    id               = var.gateway_services_echo.id
  }
}