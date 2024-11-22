#!/bin/bash

# This bash script is executed as part of the pre-commit hook
echo "Rendering 3-multi-provider-jinja-config.tf using jinja"
cp ./terraform/3-multi-provider-jinja-config.tf ./terraform/config.tf.bak
jinja2 --format=yaml ./terraform/config.jinja ./terraform/deployment_manifest.yaml > ./terraform/3-multi-provider-jinja-config.tf

# Check for differences between the old and new config.tf
if diff -q ./terraform/config.tf.bak ./terraform/3-multi-provider-jinja-config.tf >/dev/null; then
    echo "No changes detected in 3-multi-provider-jinja-config.tf"
    rm ./terraform/config.tf.bak
    exit 0
else
    echo "Changes detected in 3-multi-provider-jinja-config.tf, please add it to your commit"
    rm ./terraform/config.tf.bak
    exit 1
fi