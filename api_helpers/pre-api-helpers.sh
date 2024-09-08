#!/bin/bash

echo "Executing Pre-API Helpers"
ls -al $DEFAULT_PATH
echo $DEFAULT_PATH/terraform/config.jinja
echo $DEFAULT_PATH/terraform/deployment_manifest.yaml
echo $DEFAULT_PATH/terraform/config.tf
jinja2 --format=yaml $DEFAULT_PATH/terraform/config.jinja $DEFAULT_PATH/terraform/deployment_manifest.yaml > $DEFAULT_PATH/terraform/config.tf