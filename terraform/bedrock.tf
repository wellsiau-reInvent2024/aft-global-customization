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