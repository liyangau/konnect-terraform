# Changelog

## Updated on 2024/07/26

- Refactor Control plane module to take in local variable to create control plane dynamically.
- Update Konnect terraform provider to 0.6.1
  - Dev portal can ONLY be manged via import and supports managing multiple portal.
  - dev-portal module can manage multiple portal assets.
- Add `Dedicated Cloud Gateway` support.
- Add `Network` support
- Add `Transit Gateway` support. This allows the Cloud gateway to send request to API in a different AWS account via Shared Transit Gateway.
- Refactor Kong config module by supporting different configs for different control planes.

All control-plane, network, cloud gateay and transit gateway should be defined in `infra-variables.tf`. 

