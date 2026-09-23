resource "docker_network" "red_web_api_dev" {
  name = "red-web-api-dev"
}

resource "docker_network" "red_api_bd_dev" {
  name = "red-api-bd-dev"
}

resource "docker_network" "red_web_api_qa" {
  name = "red-web-api-qa"
}

resource "docker_network" "red_api_bd_qa" {
  name = "red-api-bd-qa"
}