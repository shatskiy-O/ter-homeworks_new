resource "yandex_compute_disk" "disk" {
  count = 3
  name  = "extra-disk-${count.index}"
  type  = "network-hdd"
  size  = 1
  zone  = "ru-central1-a"
}

resource "yandex_compute_instance" "storage" {
  name = "storage"
  zone = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd82sqrj4uk9j7vlki3q" 
    }
  }

  network_interface {
    subnet_id = "e9b1r9plpg4of6fk3jnm" 
    security_group_ids = ["enpq6bm1538jc4pkqh0b"]
  }

  metadata = {
    ssh-keys = "ubuntu:${file("/Users/shatskie/.ssh/netologia1.pub")}"
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disk.*.id
    content {
      auto_delete = true
      disk_id = secondary_disk.value
    }
  }
}

