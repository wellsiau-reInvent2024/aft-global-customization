# Custom Fields Lookup Module

## Overview

This Terraform module is designed to look up custom fields stored as SSM parameters in AWS Control Tower Account Factory for Terraform (AFT). It retrieves metadata associated with AWS accounts that have been previously defined as custom fields.

## Features

- Retrieves SSM parameters for custom fields
- Supports looking up multiple custom fields
- Integrates with AFT account provisioning process by providing access to custom metadata

## Resources Used

This module uses the following data source:

- `aws_ssm_parameters_by_path`: To retrieve all SSM parameters under the `/aft/account-request/custom-fields/` path

## Inputs

This module does not require any inputs.

## Outputs

| Name | Description |
|------|-------------|
| custom_fields | A map of custom fields with their types and descriptions |

## Configuration Details

The module:

1. Looks up all SSM parameters under the path `/aft/account-request/custom-fields/`
2. Parses the JSON content of each parameter
3. Constructs a map of custom fields with their respective types and descriptions

## Use in AFT

This module can be used in the Account Factory for Terraform (AFT) process to access additional metadata associated with AWS accounts. This metadata can be leveraged in account customizations or for organizational purposes.

## Best Practices

- Ensure that custom fields are properly defined and stored as SSM parameters before using this module
- Use the output of this module to dynamically adjust account provisioning or customization based on the available custom fields
- Regularly review the custom fields to ensure they are up-to-date and relevant

## Limitations

- This module only retrieves existing custom fields; it does not create or modify them
- The module assumes that the SSM parameters are stored in a specific format (JSON string containing 'type' and 'description')

## Troubleshooting

- If expected custom fields are not appearing in the output, verify that the corresponding SSM parameters exist and are correctly formatted
- Ensure that the IAM role used by Terraform has the necessary permissions to read SSM parameters

## License

Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
SPDX-License-Identifier: Apache-2.0
