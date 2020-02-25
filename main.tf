data "aws_secretsmanager_secret_version" "this" {
  secret_id     = var.secret_id
  version_stage = var.version_stage
  version_id    = var.version_id
}

data "external" "this" {
  program = ["echo", data.aws_secretsmanager_secret_version.this.secret_string]
}

