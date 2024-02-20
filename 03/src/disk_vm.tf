resource "yandex_compute_disk" "extra" {
  count = 3

  name = "extra-disk-${count.index}"
  type = "network-hdd"
  size = 10
  zone = var.default_zone
}

resource "yandex_compute_instance" "storage" {
  name = "storage"
  zone = var.default_zone

  resources {
    cores  = 2
    memory = 2 * 1024
  }

  boot_disk {
    initialize_params {
      image_id = "fd8vmcue78k9umdv6l28" # Ubuntu image
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_public_key)}"
  }

  secondary_disk {
    for_each = toset(yandex_compute_disk.extra.*.id)
    disk_id  = each.value
  }
}


