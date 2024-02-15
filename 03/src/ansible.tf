resource "local_file" "ansible_inventory" {
  content  = templatefile("${path.module}/inventory.tpl", {
    webservers = [for instance in yandex_compute_instance.web : {
      name        = instance.name
      nat_ip_address = instance.network_interface.0.nat_ip_address
      fqdn        = instance.fqdn
    }],
    databases  = [for k, v in yandex_compute_instance.db : {
      name        = v.name
      nat_ip_address = v.network_interface.0.nat_ip_address
      fqdn        = v.fqdn
    }],
    storage    = [{
      name        = yandex_compute_instance.storage.name
      nat_ip_address = yandex_compute_instance.storage.network_interface.0.nat_ip_address
      fqdn        = yandex_compute_instance.storage.fqdn
    }]
  })
  filename = "${path.module}/inventory.ini"
}

