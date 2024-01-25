terraform {
  required_version = ">= 0.13.0"
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}
provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

module "app" {
  source           = "../modules/app"
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
  subnet_id        = module.vpc.subnet_id
  name_prefix      = var.name_prefix
}
module "db" {
  source           = "../modules/db"
  public_key_path  = var.public_key_path
  subnet_id        = module.vpc.subnet_id
  name_prefix      = var.name_prefix
}
module "vpc" {
  source = "../modules/vpc"
  name_prefix = var.name_prefix
}
