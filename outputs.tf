output "this_db_instance_ids" {
  value = "${join(",", alicloud_gpdb_instance.this_instance.*.id)}"
}
