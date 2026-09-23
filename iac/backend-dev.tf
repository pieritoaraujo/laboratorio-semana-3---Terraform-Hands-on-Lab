resource "docker_container" "api_dev" {
  name    = "api-dev"
  image   = docker_image.back.image_id
  restart = "unless-stopped"

  env = [
    "ENTORNO=dev",
    "DB_HOST=bd-dev",
    "DB_PORT=5432",
  ]

  ports {
    internal = 3000
    external = var.puertos["dev"].api
  }

  networks_advanced {
    name = docker_network.red_web_api_dev.name
  }

  networks_advanced {
    name = docker_network.red_api_bd_dev.name
  }

  depends_on = [docker_container.bd_dev]
}