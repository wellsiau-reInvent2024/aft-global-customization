# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

resource "awscc_bedrock_guardrail" "general" {
  name                      = "general-${random_string.suffix.result}"
  blocked_input_messaging   = "Unfortunately we are unable to provide response for this input"
  blocked_outputs_messaging = "Unfortunately we are unable to provide response for this input"
  description               = "Basic Bedrock Guardrail for sensitive info exfiltration"

  # detect and filter harmful user inputs and FM-generated outputs
  content_policy_config = {
    filters_config = [
      {
        input_strength  = "HIGH"
        output_strength = "HIGH"
        type            = "SEXUAL"
      },
      {
        input_strength  = "HIGH"
        output_strength = "HIGH"
        type            = "VIOLENCE"
      },
      {
        input_strength  = "HIGH"
        output_strength = "HIGH"
        type            = "HATE"
      },
      {
        input_strength  = "HIGH"
        output_strength = "HIGH"
        type            = "INSULTS"
      },
      {
        input_strength  = "HIGH"
        output_strength = "HIGH"
        type            = "MISCONDUCT"
      },
      {
        input_strength  = "NONE"
        output_strength = "NONE"
        type            = "PROMPT_ATTACK"
      }
    ]
  }

  # block / mask potential PII information
  sensitive_information_policy_config = {
    pii_entities_config = [
      {
        action = "BLOCK"
        type   = "DRIVER_ID"
      },
      {
        action = "BLOCK"
        type   = "PASSWORD"
      },
      {
        action = "ANONYMIZE"
        type   = "EMAIL"
      },
      {
        action = "ANONYMIZE"
        type   = "USERNAME"
      },
      {
        action = "BLOCK"
        type   = "AWS_ACCESS_KEY"
      },
      {
        action = "BLOCK"
        type   = "AWS_SECRET_KEY"
      },
    ]
    regexes_config = [{
      action      = "BLOCK"
      description = "SSN regex"
      name        = "SSN"
      pattern     = "^\\d{3}-\\d{2}-\\d{4}$"
    }]
  }

  # block select word / profanity
  word_policy_config = {
    managed_word_lists_config = [{
      type = "PROFANITY"
    }]
    words_config = [{
      text = "HATE"
    }]
  }
}

resource "awscc_bedrock_guardrail_version" "version1" {
  guardrail_identifier = awscc_bedrock_guardrail.general.guardrail_id
  description          = "Initial version 1"
}