#terraform {
#  required_version = ">= 0.13.0"
#  required_providers {
#    yandex = {
#    }
#  }
#}
resource "yandex_compute_instance" "db" {
name = "${var.name_prefix}reddit-db"
labels = {
tags = "reddit-db"
}
resources {
cores = 2
memory = 2
}
boot_disk {
initialize_params {
image_id = var.db_disk_image
}
}
network_interface {
subnet_id = var.subnet_id
nat = true
}
metadata = {
  ssh-keys = "ubuntu:${file(var.public_key_path)}"
}

connection {
  type  = "ssh"
  host  = self.network_interface.0.nat_ip_address
  user  = "ubuntu"
  agent = false
  # путь до приватного ключа
  private_key = file(var.private_key_path)
}
}
