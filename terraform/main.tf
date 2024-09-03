resource "aws_s3_account_public_access_block" "block_all_public" {
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

module "bedrock_guardrail_us_east_1" {
  providers = {
    aws   = aws
    awscc = awscc
  }
  source = "./modules/bedrock"
}

module "bedrock_guardrail_us_west_2" {
  providers = {
    aws   = aws.us_west_2
    awscc = awscc.us_west_2
  }
  source = "./modules/bedrock"
}