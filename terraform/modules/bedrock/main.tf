# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

resource "aws_bedrock_guardrail" "general" {
  name                      = "general-${random_string.suffix.result}"
  blocked_input_messaging   = "Unfortunately we are unable to provide response for this input"
  blocked_outputs_messaging = "Unfortunately we are unable to provide response for this input"
  description               = "Basic Bedrock Guardrail"

  content_policy_config {
    filters_config {
      input_strength  = "MEDIUM"
      output_strength = "MEDIUM"
      type            = "PROMPT_ATTACK"
    }
    filters_config {
      input_strength  = "MEDIUM"
      output_strength = "MEDIUM"
      type            = "HATE"
    }
  }
}

resource "aws_bedrock_guardrail_version" "version1" {
  guardrail_arn = aws_bedrock_guardrail.general.guardrail_arn
  description   = "Initial version 1"
}