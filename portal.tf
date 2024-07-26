# resource "konnect_portal" "default_portal" {
#   auto_approve_applications = false
#   auto_approve_developers   = false
#   custom_domain             = "portal.fomm.au"
#   is_public                 = false
#   rbac_enabled              = false
#   name                      = "foMM Default Dev Portal"
# }

# import {
#   to = konnect_portal.default_portal
#   id = "2698b8cd-3ade-4faa-8524-ad798ea3e2f0"
# }