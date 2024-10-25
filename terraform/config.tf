# To use this template
# jinja2 --format=yaml config.jinja deployment_manifest.yaml


module "config_conformance_pack_prod" {
  providers = {
    aws   = aws.us_east_1
    awscc = awscc.us_east_1
  }
  source                = "./modules/config"
  conformance_pack_name = "Operational-Best-Practices-for-AI-and-ML"
}

module "config_conformance_pack_failover" {
  providers = {
    aws   = aws.us_west_2
    awscc = awscc.us_west_2
  }
  source                = "./modules/config"
  conformance_pack_name = "Operational-Best-Practices-for-AI-and-ML"
}

module "config_conformance_pack_staging" {
  providers = {
    aws   = aws.us_east_2
    awscc = awscc.us_east_2
  }
  source                = "./modules/config"
  conformance_pack_name = "Operational-Best-Practices-for-AI-and-ML"
}

