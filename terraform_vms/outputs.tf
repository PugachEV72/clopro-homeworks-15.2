output "public" {
  value = "${yandex_compute_instance.public_vm.name} - ${yandex_compute_instance.public_vm.network_interface.0.ip_address}(${yandex_compute_instance.public_vm.network_interface.0.nat_ip_address})"
}

output "private" {
  value = "${yandex_compute_instance.private_vm.name} - ${yandex_compute_instance.private_vm.network_interface.0.ip_address}(${yandex_compute_instance.private_vm.network_interface.0.nat_ip_address})"
}

