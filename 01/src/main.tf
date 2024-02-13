terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
  required_version = ">=0.13" // Требуемая версия Terraform
}

provider "docker" {}

// Генерация случайного пароля
resource "random_password" "random_string" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

// Вывод сгенерированного пароля
output "generated_password" {
  value     = random_password.random_string.result
  sensitive = true
}

// Определение Docker образа
resource "docker_image" "nginx" {
  name         = "nginx:latest"
}

// Создание Docker контейнера
resource "docker_container" "nginx" {
  image = docker_image.nginx.name
  name  = "hello_world"

  ports {
    internal = 80
    external = 9090
    ip       = "0.0.0.0"
  }
}





