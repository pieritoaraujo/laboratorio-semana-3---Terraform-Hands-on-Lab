resource "docker_container" "web_dev" {
  name    = "web-dev"
  image   = docker_image.front.image_id
  restart = "unless-stopped"

  env = [
    "API_HOST=api-dev",
  ]

  ports {
    internal = 80
    external = var.puertos["dev"].web
  }

  networks_advanced {
    name = docker_network.red_web_api_dev.name
  }

  depends_on = [docker_container.api_dev]
}