provider "alicloud" {
  region = "ap-southeast-1"
}

data "alicloud_gpdb_zones" "default" {
}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_gpdb_zones.default.zones.0.id
}

module "gpdb_instance" {
  source = "../.."

  #alicloud_gpdb_instance
  number_of_instances  = 1
  engine               = "gpdb"
  engine_version       = "6.0"
  description          = var.description
  db_instance_mode     = "StorageElastic"
  instance_class       = "gpdb.group.segsdx1"
  db_instance_category = "HighAvailability"
  instance_spec        = var.instance_spec
  seg_node_num         = var.seg_node_num
  seg_storage_type     = "cloud_essd"
  storage_size         = var.storage_size
  instance_group_count = "2"
  security_ip_list     = var.security_ip_list
  vswitch_id           = data.alicloud_vswitches.default.vswitches.0.id
  availability_zone    = data.alicloud_gpdb_zones.default.zones.0.id

  #alicloud_gpdb_connection
  connection_prefix = "tf-testacc"
  port              = var.port

}
