# Bedrock Guardrail Module

## Overview

This Terraform module creates an Amazon Bedrock guardrail configuration. It's designed to set up content filtering and safety measures for Bedrock AI model interactions.

## Features

- Creates a Bedrock guardrail with a randomized suffix for uniqueness
- Configures content policy filters for sensitive content
- Sets up blocked input and output messaging
- Implements regex patterns for sensitive information detection

## Resources Created

This module creates the following resources:

- `random_string.random_suffix`: Generates a random string to ensure unique resource names
- `aws_bedrock_guardrail`: Creates a Bedrock guardrail with specified configurations

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The name of the Bedrock guardrail | string | n/a | yes |

## Outputs

This module does not define any outputs.

## Configuration Details

The module creates a Bedrock guardrail with the following configurations:

1. **Name**: Combines the provided name with a random suffix for uniqueness
2. **Blocked Input Messaging**: Configures a message for blocked input
3. **Blocked Output Messaging**: Sets up a message for blocked output
4. **Content Filter**: Implements a policy to filter sensitive content
   - Blocks content related to hate speech, self-harm, sexual content, and violence
5. **Regex Pattern**: Defines patterns to detect sensitive information like credit card numbers and social security numbers

## Usage Considerations

- The guardrail name must be unique within your AWS account and region
- Consider the implications of content filtering on your specific use case
- Regularly review and update the regex patterns to ensure they catch evolving patterns of sensitive information

## Best Practices

- Use descriptive names for your guardrails to easily identify their purpose
- Regularly review and update the content filter policies to align with your organization's evolving needs
- Test the guardrail thoroughly to ensure it doesn't overly restrict legitimate use cases

## Customization

You can customize the module by modifying the following aspects:

- Adjusting the content filter policies
- Modifying or expanding the regex patterns for sensitive information detection
- Customizing the blocked input and output messages

## License

Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
SPDX-License-Identifier: Apache-2.0
