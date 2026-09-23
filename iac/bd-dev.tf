resource "docker_volume" "bd_data_dev" {
  name = "bd-data-dev"
}

resource "docker_container" "bd_dev" {
  name    = "bd-dev"
  image   = docker_image.postgres.image_id
  restart = "unless-stopped"

  env = [
    "POSTGRES_USER=admin",
    "POSTGRES_PASSWORD=admin123",
    "POSTGRES_DB=app_dev",
  ]

  ports {
    internal = 5432
    external = var.puertos["dev"].bd
  }

  networks_advanced {
    name = docker_network.red_api_bd_dev.name
  }

  volumes {
    volume_name    = docker_volume.bd_data_dev.name
    container_path = "/var/lib/postgresql/data"
  }
}