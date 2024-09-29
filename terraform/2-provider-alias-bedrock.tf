# Deploy bedrock guardrail at home region
module "bedrock_guardrail_us_east_1" {
  source = "./modules/bedrock"
}

# Deploy bedrock guardrail at us-west-2 using provider alias
# module "bedrock_guardrail_us_west_2" {
#   providers = {
#     aws   = aws.us_west_2
#     awscc = awscc.us_west_2
#   }
#   source = "./modules/bedrock"
# }