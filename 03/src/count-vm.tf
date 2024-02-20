resource "yandex_compute_instance" "web" {
  count = 2

  name        = "web-${count.index + 1}"
  zone        = var.default_zone
  hostname    = "web-${count.index + 1}"
  platform_id = "standard-v2"

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
}



