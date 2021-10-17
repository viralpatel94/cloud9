<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_backup"></a> [backup](#module\_backup) | ./backup |  |
| <a name="module_cloud9"></a> [cloud9](#module\_cloud9) | ./cloud9 |  |
| <a name="module_secerts"></a> [secerts](#module\_secerts) | ./secrets |  |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.vpc](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | Access key used to deploy into AWS | `string` | `""` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The instance type of the cloud9 instance | `string` | `"m5.large"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name to be used on all the resources as identifier | `string` | `""` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner of the repo | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | region used for AZ | `string` | `""` | no |
| <a name="input_repo"></a> [repo](#input\_repo) | The name of the repo | `string` | n/a | yes |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | Secert key used to deploy into AWS | `string` | `""` | no |
| <a name="input_token"></a> [token](#input\_token) | The token for clone a repo | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud9_ide"></a> [cloud9\_ide](#output\_cloud9\_ide) | ARN of the Cloud9 IDE |
| <a name="output_s3_bucket"></a> [s3\_bucket](#output\_s3\_bucket) | ARN of the S3 bucket ot house code |
| <a name="output_secret_arn"></a> [secret\_arn](#output\_secret\_arn) | ARN of the secret that has the github token |
| <a name="output_token_arn"></a> [token\_arn](#output\_token\_arn) | ARN of the secret that has the github token |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
