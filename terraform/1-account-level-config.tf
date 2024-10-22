# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

# Look up all custom fields available at the account level SSM parameter
# module "aft_custom_fields" {
#   source = "./modules/custom_fields"
# }

# map tags and features from SSM parameter
# locals {
#   tags     = jsondecode(lookup(module.aft_custom_fields.values, "tags", "{}"))
#   features = jsondecode(lookup(module.aft_custom_fields.values, "features", "{}"))
# }

# apply account level config per each feature
# module "default_account_config" {
#   source = "./modules/default_account_config"

#   enable_s3_bpa           = lookup(local.features, "s3_bpa", true)
#   enable_ami_bpa          = lookup(local.features, "ami_bpa", true)
#   enforce_ebs_encryption  = lookup(local.features, "ebs_encryption", true)
#   enforce_imdsv2          = lookup(local.features, "imdsv2", true)
#   enable_ebs_snapshot_bpa = lookup(local.features, "ebs_snapshot_bpa", true)
# }