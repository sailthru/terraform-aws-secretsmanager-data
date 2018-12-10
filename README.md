# Terraform module that returns a map form AWS Secrets Manager JSON string

Terraform module which is used for reading a JSON secret form the AWS
Secrets Manager and returning a map that can be used in plans

## Usage

### Secrets in JSON

`/tmp/dev.json`

```json
{
  "docker_hub_user" : "foo",
  "docker_hub_pass" : "dragons"
}

```

### Create AWS secrets manager secret with the JSON string

```bash
aws secretsmanager create-secret \
  --name DevEnv \
  --description "Secrets for DEV environment" \
  --secret-string file:///tmp/dev.json
```

### Use secrets in a Terraform plan

```hcl
module "aws_dev_secrets" {
  source  = "sailthru/secretsmanager-data/aws"
  secret_id = "DevEnv"
}

locals {
  docker_hub_user = "${module.aws_dev_secrets.secret_map["docker_hub_user"]}"
  docker_hub_pass = "${module.aws_dev_secrets.secret_map["docker_hub_pass"]}"
}

output "docker_hub_user" {
  value = "${local.docker_hub_user"]}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws_region | AWS region to use | string | `us-east-1` | no |
| aws_profile | AWS credentials profile to use | string | `` | no |
| secret_id | Specifies the secret containing the version that you want to retrieve. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret. | string | - | yes |
| version_id | Specifies the unique identifier of the version of the secret that you want to retrieve. Overrides version_stage | string | `` | no |
| version_stages | Specifies the secret version that you want to retrieve by the staging label attached to the version. Defaults to AWSCURRENT | string | `AWSCURRENT` | no |
