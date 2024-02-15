resource "yandex_compute_instance" "web" {
  count = 2
  name  = "web-${count.index + 1}"

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
}


