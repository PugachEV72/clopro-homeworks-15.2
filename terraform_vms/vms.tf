resource "yandex_compute_instance" "nat-instance" {
  name     = "nat-instance"
  hostname = "nat-instance"
  zone     = var.default_zone
  boot_disk {
    initialize_params {
      image_id    = var.nat-instance-image-id
      size        =  var.vm_base.disk_size
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    ip_address = var.nat-instance-ip
    nat       = true
  }
  resources {
    cores         = var.vm_base.cores
    memory        = var.vm_base.memory
    core_fraction = var.vm_base.core_fraction
  }
  metadata = local.ssh_keys_and_serial_port
}

resource "yandex_compute_instance" "public_vm" {
  name        = "public-vm"
  hostname    = "public-vm"
  platform_id = "standard-v1"
  boot_disk {
    initialize_params {
      image_id = var.vm_base.image_id
      size     = var.vm_base.disk_size
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
  }
  resources {
    cores         = var.vm_base.cores
    memory        = var.vm_base.memory
    core_fraction = var.vm_base.core_fraction
  }
  metadata = local.ssh_keys_and_serial_port
}

resource "yandex_compute_instance" "private_vm" {
  name        = "private-vm"
  hostname    = "private-vm"
  platform_id = "standard-v1"
  boot_disk {
    initialize_params {
      image_id = var.vm_base.image_id
      size     = var.vm_base.disk_size
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.private.id
    nat       = false
  }
  resources {
    cores         = var.vm_base.cores
    memory        = var.vm_base.memory
    core_fraction = var.vm_base.core_fraction
  }
  metadata = local.ssh_keys_and_serial_port
}
