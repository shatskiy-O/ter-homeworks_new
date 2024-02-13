### Переменные для первой ВМ (Web)
variable "vm_web_name" {
  type        = string
  description = "The name of the web VM instance."
  default     = "netology-develop-platform-web"
}

variable "vm_web_platform_id" {
  type        = string
  description = "The ID of the platform for the web VM."
  default     = "standard-v1"
}

variable "vm_web_cores" {
  type        = number
  description = "The number of cores for the web VM."
  default     = 2
}

variable "vm_web_memory" {
  type        = number
  description = "The amount of memory for the web VM in GB."
  default     = 2
}

variable "vm_web_core_fraction" {
  type        = number
  description = "The core fraction for the web VM."
  default     = 5
}

variable "vm_web_preemptible" {
  type        = bool
  description = "Defines if the web VM is preemptible."
  default     = true
}

variable "vm_web_nat" {
  type        = bool
  description = "Defines if NAT is used for the web VM."
  default     = true
}

### Переменные для второй ВМ (DB)
variable "vm_db_name" {
  type        = string
  description = "The name of the DB VM instance."
  default     = "netology-develop-platform-db"
}

variable "vm_db_platform_id" {
  type        = string
  description = "The ID of the platform for the DB VM."
  default     = "standard-v1"
}

variable "vm_db_cores" {
  type        = number
  description = "The number of cores for the DB VM."
  default     = 2
}

variable "vm_db_memory" {
  type        = number
  description = "The amount of memory for the DB VM in GB."
  default     = 2
}

variable "vm_db_core_fraction" {
  type        = number
  description = "The core fraction for the DB VM."
  default     = 20
}

variable "vm_db_zone" {
  type        = string
  description = "The zone for the DB VM."
  default     = "ru-central1-b"
}


