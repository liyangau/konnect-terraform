# Kong Konnect Terraform Provider Demo

This repository serves as a demonstration of how to manage Kong Konnect resources declaratively using the [Konnect Terraform Provider](https://github.com/Kong/terraform-provider-konnect).

## Caution

**Caution:** This repository is currently in its early development phase. Expect updates and breaking changes to functionality as development progresses.

## Features

- Utilizes an S3 bucket as a Terraform backend.
- Leverages Nix for local dev environment setup.
  - Easily configure your system or personal access tokens using the `.env` file, automatically loaded by `nix-direnv`.
  - Customize Konnect Control plane region with the `cp_region` variable, preset to `au` by default.
  - Integrate AWS credentials into the `.env` file for S3 bucket usage.
    - Set the following variables in the `.env` file:
      - `AWS_ACCESS_KEY_ID`
      - `AWS_SECRET_ACCESS_KEY`
      - `AWS_ENDPOINT_URL_S3`
- Utilizes GitHub Actions to enhance the development and deployment workflow:
  - Automatically generates `terraform plan` output as a comment on pull requests.
  - Applies changes to Kong Konnect upon merging, streamlining deployment processes.