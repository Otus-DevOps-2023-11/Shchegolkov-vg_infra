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
  default     = "reddit-app-base"
}
variable "db_disk_image" {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}
variable "name_prefix" {
default = ""
}
