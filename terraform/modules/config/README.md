# AWS Config Conformance Pack Module

## Overview

This Terraform module deploys AWS Config conformance packs in an AWS account. It provides a streamlined way to implement a set of AWS Config rules and remediation actions based on the input conformance pack YAML file.

## Features

- Deploys AWS Config conformance packs
- Supports custom conformance pack templates
- Enables consistent compliance checks across your AWS environment

## Resources Created

This module creates the following resource:

- `aws_config_conformance_pack`: Deploys the specified AWS Config conformance pack

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The name of the conformance pack | string | n/a | yes |
| template_body | The YAML template for the conformance pack | string | n/a | yes |

## Outputs

This module does not define any outputs.

## Configuration Details

The module takes a conformance pack template in YAML format and deploys it as an AWS Config conformance pack. The conformance pack can include multiple AWS Config rules and their associated remediation actions.

## Best Practices

- Regularly review and update your conformance pack templates to align with your evolving security and compliance needs
- Test conformance pack templates in a non-production environment before deploying to production
- Use version control for your conformance pack templates to track changes over time
- Ensure that the template_body is valid YAML and follows AWS Config conformance pack specifications

## Limitations

- This module deploys a single conformance pack per invocation
- The conformance pack name must be unique within your AWS account and region

## Troubleshooting

- If the conformance pack fails to deploy, check the YAML syntax of your template
- Ensure that the IAM role used by AWS Config has the necessary permissions to create and manage the resources defined in your conformance pack

## License

Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
SPDX-License-Identifier: Apache-2.0
