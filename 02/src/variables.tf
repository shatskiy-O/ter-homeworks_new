variable "cloud_id" {
  type        = string
  description = "The ID of the Yandex Cloud."
  default     = "b1gqplu7anv4utuk8hl5"
}

variable "folder_id" {
  type        = string
  description = "The ID of the folder in Yandex Cloud."
  default     = "b1gn7r8lhgjmcmog5ip0"
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC network."
  default     = "develop"
}

variable "default_zone" {
  type        = string
  description = "The default zone for resources in Yandex Cloud."
  default     = "ru-central1-a"
}

variable "default_cidr" {
  type        = list(string)
  description = "List of CIDR blocks for the subnet."
  default     = ["10.0.1.0/24"]
}

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  description = "Map of VM resource configurations"
}

variable "metadata" {
  type = map(string)
  description = "Common metadata for all VMs"
}

variable "yandex_token" {
  description = "Token for Yandex Cloud API"
  type        = string
}



