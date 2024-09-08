# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

locals {
  conformance_pack_file_name = "./aws-config-conformance-packs/${var.conformance_pack_name}.yaml"
  file_exist                 = fileexists(local.conformance_pack_file_name) ? true : false
}

resource "awscc_config_config_rule" "s3_versioning" {
  config_rule_name = "S3_bucket_versioning_enabled"
  description      = "Rule to validate if S3 Bucket versioning is enabled"
  evaluation_modes = [{
    mode = "DETECTIVE"
  }]

  source = {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_VERSIONING_ENABLED"
  }
}

resource "awscc_config_conformance_pack" "sagemaker_us_east_1" {
  count                 = local.file_exist ? 1 : 0
  conformance_pack_name = "${var.conformance_pack_name}-${random_string.suffix.result}"
  template_body         = file(local.conformance_pack_file_name)
}

# resource "awscc_config_conformance_pack" "sagemaker_us_west_2" {
#   count = local.conformance_pack_file_name != "n/a" ? 1 : 0
#   conformance_pack_name = "Security-Best-Practices-for-SageMaker"
#   template_body         = file("./aws-config-conformance-packs/Security-Best-Practices-for-SageMaker.yaml")
#   provider              = awscc.us_west_2
# }