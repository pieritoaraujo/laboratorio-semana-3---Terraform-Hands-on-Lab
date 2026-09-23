resource "docker_volume" "bd_data_qa" {
  name = "bd-data-qa"
}

resource "docker_container" "bd_qa" {
  name    = "bd-qa"
  image   = docker_image.postgres.image_id
  restart = "unless-stopped"

  env = [
    "POSTGRES_USER=admin",
    "POSTGRES_PASSWORD=admin123",
    "POSTGRES_DB=app_qa",
  ]

  ports {
    internal = 5432
    external = var.puertos["qa"].bd
  }

  networks_advanced {
    name = docker_network.red_api_bd_qa.name
  }

  volumes {
    volume_name    = docker_volume.bd_data_qa.name
    container_path = "/var/lib/postgresql/data"
  }
}