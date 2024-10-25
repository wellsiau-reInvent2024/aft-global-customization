#!/bin/bash

echo "Rendering config.tf using jinja"
cp ./terraform/config.tf ./terraform/config.tf.bak
jinja2 --format=yaml ./terraform/config.jinja ./terraform/deployment_manifest.yaml > ./terraform/config.tf

# Check for differences between the old and new config.tf
if diff -q ./terraform/config.tf.bak ./terraform/config.tf >/dev/null; then
    echo "No changes detected in config.tf"
    exit 0
else
    echo "Changes detected in config.tf"
    exit 1
fi