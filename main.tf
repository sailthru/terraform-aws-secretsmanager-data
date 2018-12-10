provider "aws" {
  version = "~> 1.40"
  region = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

data "aws_secretsmanager_secret_version" "this" {
  secret_id     = "${var.secret_id}"
  version_stage = "${var.version_stage}"
  version_id    = "${var.version_id}"
}

data "external" "this" {
  program = ["echo", "${data.aws_secretsmanager_secret_version.this.secret_string}"]
}
