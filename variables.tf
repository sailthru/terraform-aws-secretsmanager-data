variable "aws_region" {
  description = "AWS region to use"
  default = "us-east-1"
}

variable "secret_id" {
  description = "Specifies the secret containing the version that you want to retrieve. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret."
}

variable "version_id" {
  description = "Specifies the unique identifier of the version of the secret that you want to retrieve. Overrides version_stage"
  default = ""
}

variable "version_stage" {
  description = "Specifies the secret version that you want to retrieve by the staging label attached to the version. Defaults to AWSCURRENT"
  default = "AWSCURRENT"
}
