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

resource "awscc_config_conformance_pack" "this" {
  count                 = local.file_exist ? 1 : 0
  conformance_pack_name = "${var.conformance_pack_name}-${random_string.suffix.result}"
  template_body         = file(local.conformance_pack_file_name)
}