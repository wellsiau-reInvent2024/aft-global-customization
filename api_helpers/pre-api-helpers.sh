#!/bin/bash

echo "Executing Pre-API Helpers"
which jinja2
jinja2 --format=yaml $DEFAULT_PATH/terraform/config.jinja $DEFAULT_PATH/terraform/deployment_manifest.yaml > $DEFAULT_PATH/terraform/config.tf