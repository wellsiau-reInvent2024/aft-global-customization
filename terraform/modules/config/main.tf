# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
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
  conformance_pack_name = "Security-Best-Practices-for-SageMaker"
  template_body         = file("./aws-config-conformance-packs/Security-Best-Practices-for-SageMaker.yaml")
}

resource "awscc_config_conformance_pack" "sagemaker_us_west_2" {
  conformance_pack_name = "Security-Best-Practices-for-SageMaker"
  template_body         = file("./aws-config-conformance-packs/Security-Best-Practices-for-SageMaker.yaml")
  provider              = awscc.us_west_2
}