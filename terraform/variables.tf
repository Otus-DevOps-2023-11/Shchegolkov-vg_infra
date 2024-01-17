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
variable "image_id" {
  description = "Image"
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
