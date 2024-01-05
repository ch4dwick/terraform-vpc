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

## Disclaimer:

This is a work in progress. I am by no means an expert on networking or on AWS. All of the configuration defined here are best-guess or defaults. I take no responsibility for any incurred costs resulting from the AWS resources created by these files.
