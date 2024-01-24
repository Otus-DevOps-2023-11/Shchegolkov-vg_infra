
  terraform {
    backend "s3" {
      endpoints = {
        s3 = "http://storage.yandexcloud.net"
      }
      bucket     = "terraform-state-block"
      region     = "ru-central1"
      key        = "terraform/prod/terraform.tfstate"
      access_key = "YCAJEF6W6LsWNRyomF_gw2Gr1"
      secret_key = "YCMmpOGcRQA6YwlXMJ6W8wFHTqJr8fAzQYgyL8Vl"

      skip_region_validation      = true
      skip_credentials_validation = true
      skip_requesting_account_id  = true
      skip_s3_checksum            = true
    }
  }
