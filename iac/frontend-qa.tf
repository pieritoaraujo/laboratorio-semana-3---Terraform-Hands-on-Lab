resource "docker_container" "web_qa" {
  name    = "web-qa"
  image   = docker_image.front.image_id
  restart = "unless-stopped"

  env = [
    "API_HOST=api-qa",
  ]

  ports {
    internal = 80
    external = var.puertos["qa"].web
  }

  networks_advanced {
    name = docker_network.red_web_api_qa.name
  }

  depends_on = [docker_container.api_qa]
}