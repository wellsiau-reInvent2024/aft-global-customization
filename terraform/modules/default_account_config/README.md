# Default Account Config Module

## Overview

This Terraform module applies default account-level configurations to AWS accounts provisioned through AWS Control Tower Account Factory for Terraform (AFT). It focuses on enabling various security features and best practices at the account level.

## Features

- Enables S3 Block Public Access at the account level
- Configures EBS encryption by default
- Enables AMI Block Public Access
- Enforces IMDSv2 for EC2 instances
- Enables EBS snapshot Block Public Access

## Resources Created

This module creates the following resources:

- `aws_s3_account_public_access_block`: Configures S3 Block Public Access at the account level
- `aws_ec2_image_block_public_access`: Enables AMI Block Public Access
- `aws_ebs_encryption_by_default`: Enables EBS encryption by default
- `aws_ebs_default_kms_key`: Sets a default KMS key for EBS encryption (if specified)
- `aws_ec2_instance_metadata_defaults`: Enforces IMDSv2 for EC2 instances
- `awscc_ec2_snapshot_block_public_access`: Enables EBS snapshot Block Public Access

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| enable_s3_bpa | Enable S3 Block Public Access | bool | - | yes |
| enable_ami_bpa | Enable AMI Block Public Access | bool | - | yes |
| enforce_ebs_encryption | Enforce EBS encryption by default | bool | - | yes |
| default_ebs_kms_key | Default KMS key for EBS encryption | string | "" | no |
| enforce_imdsv2 | Enforce IMDSv2 for EC2 instances | bool | - | yes |
| enable_ebs_snapshot_bpa | Enable EBS snapshot Block Public Access | bool | - | yes |

## Configuration Details

The module applies the following configurations based on the input variables:

1. S3 Block Public Access: Blocks public ACLs, public policy, ignores public ACLs, and restricts public buckets
2. AMI Block Public Access: Sets state to "block-new-sharing"
3. EBS Encryption by Default: Enables encryption for all new EBS volumes
4. Default KMS Key for EBS: Sets a default KMS key for EBS encryption if specified
5. IMDSv2 Enforcement: Requires the use of IMDSv2 for EC2 instances
6. EBS Snapshot Block Public Access: Blocks all sharing of EBS snapshots

## Best Practices

- Enable all security features by default unless there's a specific reason not to
- Regularly review and update these configurations to align with evolving security best practices
- Use a default KMS key for EBS encryption to enhance control over encryption

## Customization

You can customize the module behavior by adjusting the input variables. For example, you might disable certain features for specific types of accounts if required.

## Troubleshooting

- If configurations are not applying correctly, check the values of the input variables
- Ensure that the AFT execution role has the necessary permissions to modify these account-level settings
- Use AWS Config rules to monitor and ensure these settings remain enforced

## Contributing

Contributions to improve the module are welcome. Please follow the standard pull request process for your contributions.

## License

Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
SPDX-License-Identifier: Apache-2.0
