resource "konnect_application_auth_strategy" "keyauth" {
  key_auth = {
    name          = "key-auth"
    key_names     = ["apikey"]
    display_name  = "Key authentication"
    strategy_type = "key_auth"
    configs = {
      key_auth = {
        key_names = ["apikey"]
      }
    }
  }
}

resource "konnect_application_auth_strategy" "oidc" {
  openid_connect = {
    name          = "keycloak-bearer"
    display_name  = "Keycloak Bearer Auth"
    strategy_type = "openid_connect"
    configs = {
      openid_connect = {
        auth_methods     = ["bearer"]
        issuer           = "https://key.aufomm.com/auth/realms/demo/.well-known/openid-configuration"
        credential_claim = ["preferred_username"]
        scopes           = ["openid"]
      }
    }
  }
}

resource "konnect_portal" "my_portal" {
  portal_id                            = data.konnect_portal_list.my_portallist.data[0].id
  auto_approve_applications            = false
  auto_approve_developers              = false
  custom_domain                        = "portal.aufomm.com"
  is_public                            = false
  rbac_enabled                         = false
  default_application_auth_strategy_id = konnect_application_auth_strategy.keyauth.id
}

data "konnect_portal_list" "my_portallist" {
  page_number = 1
  page_size   = 1
}