terraform {
  required_version = ">= 0.13.0"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
    }
  }
}
resource "yandex_compute_instance" "app" {
name            = "${var.name_prefix}reddit-app"
labels          = {
tags            = "reddit-app"
}
resources {
cores = 2
memory = 2
}
boot_disk {
initialize_params {
image_id        = var.app_disk_image
}
}
network_interface {
subnet_id       = var.subnet_id
nat             = true
}
metadata = {
  ssh-keys     = "ubuntu:${file(var.public_key_path)}"
}

connection {
  type         = "ssh"
  host         = self.network_interface.0.nat_ip_address
  user         = "ubuntu"
  agent        = false
  private_key  = file(var.private_key_path)
}
#provisioner "file" {
#    source      = "files/puma.service"
#    destination = "/tmp/puma.service"
#  }
#  provisioner "remote-exec" {
#    script      = "files/deploy.sh"
#  }
}
