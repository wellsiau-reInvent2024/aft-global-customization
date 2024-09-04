resource "aws_s3_account_public_access_block" "block_all_public" {
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
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

module "bedrock_guardrail_us_east_1" {
  source = "./modules/bedrock"
}

module "bedrock_guardrail_us_west_2" {
  providers = {
    aws   = aws.us_west_2
    awscc = awscc.us_west_2
  }
  source = "./modules/bedrock"
}