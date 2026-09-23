resource "docker_container" "api_qa" {
  name    = "api-qa"
  image   = docker_image.back.image_id
  restart = "unless-stopped"

  env = [
    "ENTORNO=qa",
    "DB_HOST=bd-qa",
    "DB_PORT=5432",
  ]

  ports {
    internal = 3000
    external = var.puertos["qa"].api
  }

  networks_advanced {
    name = docker_network.red_web_api_qa.name
  }

  networks_advanced {
    name = docker_network.red_api_bd_qa.name
  }

  depends_on = [docker_container.bd_qa]
}