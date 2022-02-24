# terraform-alicloud-gpdb
Terraform module which creates AnalyticDB for PostgreSQL on Alibaba Cloud

----------------------

Usage
-----
You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. main.tf
    
```hcl
module "gpdb" {
  source = "terraform-alicloud-modules/gpdb/alicloud"

  # variables for gpdb instance
  
  engine                       = "gpdb"
  engine_version               = "4.3"
  instance_class               = "gpdb.group.segsdx2"
  instance_group_count         = "2"
  description                  = "myGpdbInstance"
  availability_zone            = "cn-beijing-c"
  security_ips                 = ["11.193.54.0/24","101.37.74.0/24","10.137.42.0/24","121.43.18.0/24"]
  
  # variables for gpdb connection
  instance_id                  = "gp-2ze9173c2h1kh0czy"
  connection_prefix            = "my-adb4pg-prefix"
  port                         = "3333"
  
  number_of_instances          = "2"
}
```

2. Setting `access_key` and `secret_key` values through environment variables:

    - ALICLOUD_ACCESS_KEY
    - ALICLOUD_SECRET_KEY
    - ALICLOUD_REGION


## Inputs

| Name | Description | Type | Default | Required |
| :--- | :--- | :--- | :--- | :--- |
| engine               | Database type. Value options: gpdb    |  string     |     gpdb      | yes |  
| engine_version       | Database version. Value options: 4.3   |   string  |    4.3    |    yes       |  
| description          | The name of DB instance. It a string of 2 to 256 characters.    |  string     |     ""      |    no       |
| instance_class       | DB Instance type. For details, see [Instance type table](https://www.alibabacloud.com/help/doc-detail/35406.htm).   |     string  |   ""   |    yes       |   
| instance_group_count | The number of instance group.  |  string     |     2      |     yes      |
| availability_zone    | The Zone to launch the DB instance. If vswitch_id is not set, this parameter cannot be left blank. |  string     |      ""     |   no   | 
| vswitch_id           | VSwitch ID. If you want to create VPC, this parameter cannot be left blank.  | string |     ""     |    no    |
| number_of_instances  | The number of instances you want to create | string | 1 | no |
| security_ips         | List of IP addresses allowed to access all databases of an instance. The list contains up to 1,000 IP addresses, separated by commas. Supported formats include 0.0.0.0/0, 10.23.12.24 (IP), and 10.23.12.24/24 (Classless Inter-Domain Routing (CIDR) mode. /24 represents the length of the prefix in an IP address. The range of the prefix length is [1,32]).    |   list    |    []      |      no     |
| connection_prefix    | Prefix of an Internet connection string. It must be checked for uniqueness. It may consist of lowercase letters, numbers, and underlines, and must start with a letter and have no more than 30 characters. Default to + 'tf'. | string | "" | yes |
| port                 | Internet connection port. Valid value: [3200-3999]. Default to 3306. | string | 3306 | no |

## Outputs

| Name                          | Description                             |
| ----------------------------- | --------------------------------------- |
| this_gpdb_instance_id         | List of instance ID created.            |
| this_gpdb_connection_id       | List of instance ID of gpdb connection. |

## Notes
From the version v1.2.0, the module has removed the following `provider` setting:

```hcl
provider "alicloud" {
   version              = ">=1.56.0"
   region               = var.region != "" ? var.region : null
   configuration_source = "terraform-alicloud-modules/gpdb"
}
```

If you still want to use the `provider` setting to apply this module, you can specify a supported version, like 1.1.0:

```hcl
module "gpdb" {
   source         = "terraform-alicloud-modules/gpdb/alicloud"
   version        = "1.1.0"
   region         = "cn-beijing"
   engine         = "gpdb"
   engine_version = "4.3"
   // ...
}
```

If you want to upgrade the module to 1.2.0 or higher in-place, you can define a provider which same region with
previous region:

```hcl
provider "alicloud" {
   region = "cn-beijing"
}
module "gpdb" {
   source         = "terraform-alicloud-modules/gpdb/alicloud"
   engine         = "gpdb"
   engine_version = "4.3"
   // ...
}
```
or specify an alias provider with a defined region to the module using `providers`:

```hcl
provider "alicloud" {
   region = "cn-beijing"
   alias  = "bj"
}
module "gpdb" {
   source         = "terraform-alicloud-modules/gpdb/alicloud"
   providers      = {
      alicloud = alicloud.bj
   }
   engine         = "gpdb"
   engine_version = "4.3"
   // ...
}
```

and then run `terraform init` and `terraform apply` to make the defined provider effect to the existing module state.

More details see [How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform versions

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0 |

Authors
---------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)