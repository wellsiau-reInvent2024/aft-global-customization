# aft-global-customization

This repository contains example AFT global customization in various mode:

* Account level configuration that can be deployed using single provider (`1-account-level-config.tf`).
* Resources deployed in multiple region by manually declaring the provider aliases and the resource configs (`2-provider-alias-bedrock.tf`).
* Automatically scale the resource deployment across multiple region by leveraging Jinja template, provider alias and pre-commit hook (`3-multi-provider-jinja-config.tf`).

