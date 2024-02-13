terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {
  host = "ssh://tor@51.250.89.161" 
}

resource "random_password" "mysql_root" {
  length  = 16
  special = true
}

resource "random_password" "mysql_user" {
  length  = 16
  special = true
}

resource "docker_container" "mysql" {
  image = "mysql:8"
  name  = "mysql_container" 
  env = [
    "MYSQL_ROOT_PASSWORD=${random_password.mysql_root.result}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=${random_password.mysql_user.result}",
    "MYSQL_ROOT_HOST=%"
  ]
  ports {
    internal = 3306
    external = 3306
  }
}




