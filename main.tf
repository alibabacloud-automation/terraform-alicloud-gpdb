resource "alicloud_gpdb_instance" "this_instance" {
  count                = "${var.number_of_instances}"
  engine               = "${var.engine}"
  engine_version       = "${var.engine_version}"
  description          = "${var.description}"
  instance_class       = "${var.instance_class}"
  instance_group_count = "${var.instance_group_count}"
  security_ip_list     = "${var.security_ip_list}"
  vswitch_id           = "${var.vswitch_id}"
  availability_zone    = "${var.availability_zone}"
}
