# tk-smarts-demo

## Purpose

This repository is a demo of a "smarter .kitchen.yml" pattern by Robert Murphy

## How it works

In .kitchen.yml, a helper script kitchen-helper.rb is pulled in. It
defines a lookup\_output method that will attempt to look up a CloudFormation
stack output.

In this example, the CloudFormation stack id or stack name should be
stored in the VPC\_CFN\_STACK shell environment variable before invoking
test kitchen.

## Configuring Test Kitchen
You must have access to AWS in order to execute test kitchen.

```bash
# Use bundler to install the ruby dependencies
$ bundle install

# Use test kitchen
$ kitchen list
```
