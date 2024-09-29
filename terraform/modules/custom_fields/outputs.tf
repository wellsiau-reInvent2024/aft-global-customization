# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

# output the map and re-use it on other modules
output "values" {
  description = "Custom field values"
  value       = local.aft_custom_fields
}
