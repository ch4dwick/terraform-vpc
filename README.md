# AWS VPC Terraform Cookbook

# Introduction

These files are based off the "Create VPC with subnets" option with two AZs, two public and two private subnets, one NAT gateway, VPN Client Endpoint with authorization to private subnets and internet pass-through, and a VPCE S3 Gateway.

# How to use

## Initialize

> terraform init

After cherry-picking or tweaking the files to your needs:

## Validate

> terraform validate

## Apply Plan

> terraform apply

## Limitations

With the use of length() and element(), it might no longer possible to use **terraform plan**. This is because the resources need to be applied before the values are calculated. If you attempt to run the plan, sometimes you get the following error:

> The “count” value depends on resource attributes that cannot be determined until apply, so Terraform cannot predict how many instances will be created. To work around this, use the -target argument to first apply only the resources that the count depends on.

If you get the above error, you can try applying the plan first to see if entire project will execute successfully.

## Disclaimer

This is a work in progress. I am by no means an expert on networking or on AWS. All of the configuration defined here are best-guess or defaults. I take no responsibility for any incurred costs resulting from the AWS resources created by these files.
