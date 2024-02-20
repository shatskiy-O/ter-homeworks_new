variable "default_zone" {
  description = "Default zone for cloud resources"
  type        = string
  default     = "ru-central1-a"
}

variable "ssh_public_key" {
  description = "Public SSH key for access to instances"
  type        = string
}

variable "web_vms" {
  description = "Configuration for web VM instances"
  type = list(object({
    name         = string
    image_id     = string
    disk_size_gb = number
    cores        = number
    memory_gb    = number
  }))
  default = [
    {
      name         = "web-1",
      image_id     = "fd8vmcue78k9umdv6l28", # Example image ID; replace with actual
      disk_size_gb = 10,
      cores        = 2,
      memory_gb    = 2
    },
    {
      name         = "web-2",
      image_id     = "fd8vmcue78k9umdv6l28", # Example image ID; replace with actual
      disk_size_gb = 10,
      cores        = 2,
      memory_gb    = 2
    }
  ]
}

variable "db_instances" {
  description = "Configuration for DB instances"
  type = map(object({
    cpu         = number
    ram         = number
    disk_volume = number
  }))
  default = {
    main = {
      cpu         = 4,
      ram         = 8,
      disk_volume = 50
    },
    replica = {
      cpu         = 2,
      ram         = 4,
      disk_volume = 25
    }
  }
}

variable "extra_disks" {
  description = "Configuration for extra disks"
  type = list(object({
    size = number
    type = string
  }))
  default = [
    { size = 10, type = "network-hdd" },
    { size = 10, type = "network-hdd" },
    { size = 10, type = "network-hdd" }
  ]
}
