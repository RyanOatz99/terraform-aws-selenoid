# Terraform AWS Selenoid Module

This is a terraform module to create a spot instance running Selenoid in AWS. For now only spot instances are supported and it was the main use cases I needed. Support for "on demand" instances will be added shortly

## Overview

The instance is created using the RancherOS AMI. The reasoning for this is that I was looking for a container OS given that selenoid is ran using docker within the image. RancherOS was the easiestt to configure using cloud-init, given that CoreOS was moved to Ignition based setup in the latest versions.

Once the operating system starts selenoid is setup using [Aerokube CM tool](https://github.com/aerokube/cm).

## Saving videos to S3
Saving videos to S3 currently requires you to build Selenoid yourself using a custom build tag, as described in the Selenoid documentation. For the moment this is not supported by this module but support is likely to come soon.


# Broser Versions
The most recent version of the browsers you specify in the `browsers` parameter of the module will be used.
To find out more about the format of the browser argument refer to Aerokube CM documentation https://aerokube.com/cm/latest/#_downloading_only_some_browser_versions. Some other examples are:

`firefox:51.0;firefox:55.0;chrome:66.0`

`firefox:>51.0,<=55.0;opera`

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami-id | The AMI to use to create the instance. By default the RancherOS AMI is used but any AMI that has docker pre-installed and fully supports cloud-init should work | `string` | `"ami-01e9e007e7af05e9f"` | no |
| browsers | The browsers that you want to support in the Selenium Grid. For valid options please refer to the Selenoid documentation. The default value will setup a grid for Chrome and Firefox. | `string` | `"firefox;chrome"` | no |
| cpu\_count | The number of CPU's of the instance. This will be passed to Selenoid as --limit CLI parameter. This tell Selenoid how many concurrent containers it can run. You should assign a value according to the number of CPU's of the instance type. | `number` | n/a | yes |
| instance\_role | The instance role for the Selenoid instance | `any` | `null` | no |
| instance\_type | The instance type to use for the Selenoid instance | `any` | n/a | yes |
| key\_pair | The key pair to use in case you want to SSH into the instance | `any` | `null` | no |
| security\_groups | The list of security groups to assign to the instance | `list(string)` | n/a | yes |
| spot\_price | The spot price for the spot instance request | `string` | n/a | yes |
| spot\_type | The spot type | `string` | `"persistent"` | no |
| subnet\_id | The ID of the subnet to create the instance in | `any` | n/a | yes |
| tags | The tags for the spot request (not the instance) | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| instance\_id | The ID of the instance |
| private\_ip | The private IP of the instance, you can use it to connect to the Selenium grid or to Selenoid UI on port 8080 |
| public\_ip | The public IP of the instance. |