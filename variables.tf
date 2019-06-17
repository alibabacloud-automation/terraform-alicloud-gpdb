##############################################################
# variables for alicloud_gpdb_instance
##############################################################

variable "availability_zone" {
  description = "The available zone to launch ecs instance and other resources."
  default     = ""
}

variable "vswitch_id" {
  description = "The vswitch id used to launch one or more instances."
  default     = ""
}

variable "engine" {
  description = "The database engine to use"
  default     = "gpdb"
}

variable "engine_version" {
  description = "The engine version to use"
  default     = "4.3"
}

variable "description" {
  description = "The name of DB instance. It a string of 2 to 256 characters"
}

variable "instance_class" {
  description = "DB Instance type, for example: gpdb.group.segsdx2. fall list is : https://www.alibabacloud.com/help/doc-detail/35406.htm"
}

variable "instance_group_count" {
  description = "The number of instance group."
  default     = "2"
}

variable "security_ip_list" {
  description = "List of IP addresses allowed to access all databases of an instance. The list contains up to 1,000 IP addresses, separated by commas. Supported formats include 0.0.0.0/0, 10.23.12.24 (IP), and 10.23.12.24/24 (Classless Inter-Domain Routing (CIDR) mode. /24 represents the length of the prefix in an IP address. The range of the prefix length is [1,32])."
  type        = "list"
  default     = []
}

variable "number_of_instances" {
  description = "The number of launching instances one time."
  default     = 1
}
