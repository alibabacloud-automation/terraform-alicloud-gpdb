output "this_gpdb_instance_id" {
  description = "The list of gpdb instance id."
  value       = join(",", alicloud_gpdb_instance.this_instance[*].id)
}

output "this_gpdb_connection_id" {
  description = "The list of gpdb connection id."
  value       = join(",", alicloud_gpdb_connection.connection[*].id)
}