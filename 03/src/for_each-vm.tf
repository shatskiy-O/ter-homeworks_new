variable "each_vm" {
  type = map(object({
    cpu         = number
    ram         = number
    disk_volume = number
  }))
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
  for_each = var.each_vm

  name = each.key

  resources {
    cores  = each.value.cpu
    memory = each.value.ram
  }

  boot_disk {
    initialize_params {
      image_id = "fd833q45aucu0afdc2vj"
      size     = each.value.disk_volume
    }
  }

  network_interface {
    subnet_id = "e9b1r9plpg4of6fk3jnm"
    security_group_ids = ["enpq6bm1538jc4pkqh0b"]
  }

metadata = {
  ssh-keys = "ubuntu:${file("/Users/shatskie/.ssh/netologia1.pub")}"
}

  depends_on = [yandex_compute_instance.web]
}
