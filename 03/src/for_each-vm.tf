variable "db_instances" {
  description = "Configuration for DB instances"
  default = {
    main = {
      cpu         = 4
      ram         = 8
      disk_volume = 50
    },
    replica = {
      cpu         = 2
      ram         = 4
      disk_volume = 25
    }
  }
}

resource "yandex_compute_instance" "db" {
  for_each = var.db_instances

  name = each.key
  zone = var.default_zone

  resources {
    cores  = each.value.cpu
    memory = each.value.ram * 1024
  }

  boot_disk {
    initialize_params {
      image_id = "fd8vmcue78k9umdv6l28" # Ubuntu image
      size     = each.value.disk_volume
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_public_key)}"
  }
}

