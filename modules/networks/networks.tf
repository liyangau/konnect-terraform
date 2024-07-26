resource "konnect_cloud_gateway_network" "cgw_network" {
  name   = "${var.network_name}"
  region = var.region
  availability_zones = local.availability_zones
  firewall = {
    allowed_cidr_blocks = var.allowed_cidr_blocks
  }
  cidr_block      = var.cidr_block
  ddos_protection = var.ddos_protection
  cloud_gateway_provider_account_id = data.konnect_cloud_gateway_provider_account_list.my_cloudgatewayprovideraccountlist.data[0].id
}

data "konnect_cloud_gateway_provider_account_list" "my_cloudgatewayprovideraccountlist" {
  page_number = 1
  page_size   = 1
}

locals{
  az_map  = {
    "ap-northeast-1" = ["apne1-az1", "apne1-az2", "apne1-az4"]
    "ap-southeast-1" = ["apse1-az1", "apse1-az2", "apse1-az3"]
    "ap-southeast-2" = ["apse2-az1", "apse2-az2", "apse2-az3"]
    "ap-south-1"     = ["aps1-az1", "aps1-az2", "aps1-az3"]
    "eu-central-1"   = ["euc1-az1", "euc1-az2", "euc1-az3"]
    "eu-west-1"      = ["euw1-az1", "euw1-az2", "euw1-az3"]
    "eu-west-2"      = ["euw2-az1", "euw2-az2", "euw2-az3"]
    "us-east-2"      = ["use2-az1", "use2-az2", "use2-az3"]
    "us-west-2"      = ["usw2-az1", "ustw2-az2", "usw2-az3", "usw2-az4"]
  }
  availability_zones = lookup(local.az_map, var.region, [])
}