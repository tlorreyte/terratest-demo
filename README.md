# terratest-demo
Base for a Terratest demo

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.log_static](https://registry.terraform.io/providers/hashicorp/aws/4.4.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.static](https://registry.terraform.io/providers/hashicorp/aws/4.4.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.log_static](https://registry.terraform.io/providers/hashicorp/aws/4.4.0/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_acl.static](https://registry.terraform.io/providers/hashicorp/aws/4.4.0/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_cors_configuration.static](https://registry.terraform.io/providers/hashicorp/aws/4.4.0/docs/resources/s3_bucket_cors_configuration) | resource |
| [aws_s3_bucket_logging.static](https://registry.terraform.io/providers/hashicorp/aws/4.4.0/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_policy.static](https://registry.terraform.io/providers/hashicorp/aws/4.4.0/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_versioning.static](https://registry.terraform.io/providers/hashicorp/aws/4.4.0/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_bucket_website_configuration.static](https://registry.terraform.io/providers/hashicorp/aws/4.4.0/docs/resources/s3_bucket_website_configuration) | resource |
| [aws_s3_object.error](https://registry.terraform.io/providers/hashicorp/aws/4.4.0/docs/resources/s3_object) | resource |
| [aws_s3_object.index](https://registry.terraform.io/providers/hashicorp/aws/4.4.0/docs/resources/s3_object) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Static bucket name | `string` | `"static-terratest-tlorreyte"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Static bucket tags | `map(string)` | <pre>{<br>  "Name": "static-terratest-tlorreyte",<br>  "Project": "terratest-article"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | Static bucket ARN |
| <a name="output_bucket_endpoint"></a> [bucket\_endpoint](#output\_bucket\_endpoint) | Static bucket Endpoint |
<!-- END_TF_DOCS -->