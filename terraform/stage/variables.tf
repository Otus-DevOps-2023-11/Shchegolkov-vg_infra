variable "cloud_id" {
  description = "Cloud"
}
variable "folder_id" {
  description = "Folder"
}
variable "subnet_id" {
  description = "Subnet"
}
variable "zone" {
  description = "Zone"
}
variable "private_key_path" {
  description = "private_key_path"
}
variable "public_key_path" {
  description = "public_key_path"
}
variable "service_account_key_file" {
  type        = string
  description = "service_account_key_file"
}
variable "instance_count" {
  description = "Num of instance create"
  default     = "1"
}
variable "app_disk_image" {
  description = "Disk image for reddit app"
}
variable "db_disk_image" {
  description = "Disk image for reddit db"
}
variable "instance_app_name" {
  description = "name instance"
}
variable "instance_db_name" {
  description = "name instance"
}
variable "name_prefix" {
description = "name prefix"
}
