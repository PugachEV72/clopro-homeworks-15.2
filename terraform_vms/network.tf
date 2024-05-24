resource "yandex_vpc_network" "main_network" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "subnet-public" {
  name           = "public"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.main_network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

