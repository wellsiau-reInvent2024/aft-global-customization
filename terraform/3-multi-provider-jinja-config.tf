# This template should be triggered via pre-commit config. To install it, run:
# pre-commit install
#
# To run this template manually, run:
# jinja2 --format=yaml config.jinja deployment_manifest.yaml


module "config_conformance_pack_prod" {
  providers = {
    aws   = aws.us_east_1
    awscc = awscc.us_east_1
  }
  source                = "./modules/config"
  conformance_pack_name = "Operational-Best-Practices-for-AI-and-ML"
}

