resource "alicloud_gpdb_instance" "this_instance" {
  count                = var.number_of_instances
  engine               = var.engine
  engine_version       = var.engine_version
  description          = var.description
  db_instance_mode     = var.db_instance_mode
  db_instance_class    = var.instance_class
  db_instance_category = var.db_instance_category
  instance_spec        = var.instance_spec
  seg_node_num         = var.seg_node_num
  seg_storage_type     = var.seg_storage_type
  storage_size         = var.storage_size
  instance_group_count = var.instance_group_count
  security_ip_list     = var.security_ip_list
  vswitch_id           = var.vswitch_id
  availability_zone    = var.availability_zone
}

resource "alicloud_gpdb_connection" "connection" {
  count             = var.connection_prefix != "" ? var.number_of_instances : 0
  instance_id       = alicloud_gpdb_instance.this_instance[count.index].id
  connection_prefix = var.connection_prefix
  port              = var.port
}