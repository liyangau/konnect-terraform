resource "konnect_cloud_gateway_transit_gateway" "transit_gateway" {
  for_each    = local.transit_gateways
  name        = each.value.name
  cidr_blocks = each.value.cidr_blocks
  transit_gateway_attachment_config = {
    aws_transit_gateway_attachment_config = {
      kind               = "aws-transit-gateway-attachment"
      ram_share_arn      = each.value.ram_share_arn
      transit_gateway_id = each.value.transit_gateway_id
    }
  }
  network_id = each.value.network_id
}