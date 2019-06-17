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

  #variables for db instance
  
  engine                       = "gpdb"
  engine_version               = "4.3"
  instance_class               = "gpdb.group.segsdx2"
  instance_group_count         = "2"
  description                  = "myGpdbInstance"
  availability_zone            = "cn-beijing-c"
  security_ips                 = ["11.193.54.0/24","101.37.74.0/24","10.137.42.0/24","121.43.18.0/24"]
  
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

## Outputs

| Name                          | Description                      |
| ----------------------------- | -------------------------------- |
| this_db_instance_ids          | List of instance ID created      |

Authors
---------
Created and maintained by Yewei Ouyang (@ouyangyewei, ouyangyewei@gmail.com)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)