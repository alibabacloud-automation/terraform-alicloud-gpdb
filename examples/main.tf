module "gpdb_instance" {
  source               = "../"
  engine               = "gpdb"
  engine_version       = "4.3"
  instance_class       = "gpdb.group.segsdx2"
  instance_group_count = 10
  security_ip_list     = ["10.168.1.12", "100.69.7.112"]
  description          = "my-gpdb"
  vswitch_id           = module.module_vpc.vswitch_ids
}

module "module_vpc" {
  source        = "alibaba/vpc/alicloud"
  vpc_name      = "my_module_vpc"
  vswitch_name  = "my_module_vswitch"
  vswitch_cidrs = ["172.16.1.0/24"]
}

// Zones data source for availability_zone
data "alicloud_zones" "default" {
  available_resource_creation = "Gpdb"
}

