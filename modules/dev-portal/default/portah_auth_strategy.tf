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

