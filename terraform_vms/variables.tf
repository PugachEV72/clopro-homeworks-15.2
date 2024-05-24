###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vpc_name" {
  type        = string
  default     = "main_network"
  description = "VPC net & subnet name"
}

variable "user_name" {
  type = string
  default     = "tanker"
}

variable "vm_base" {
  type = map(any)
  default = {
    cores         = 2,
    memory        = 2,
    core_fraction = 20,
    image_family  = "centos-7"
    image_id = "fd8qjapp8kkrjj35gokr"
    disk_size     = 20
  }
}

variable "ssh_public_key" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "location of ssh public key"
}

variable "nat-instance-ip" {
  default = "192.168.10.254"
}

variable "nat-instance-image-id" {
  default = "fd86d9qcjsf49bjboqkp"
}

