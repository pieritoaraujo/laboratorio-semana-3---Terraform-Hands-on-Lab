resource "docker_image" "front" {
  name = "front-app:1.0"

  build {
    context = "${path.module}/../frontend"
  }

  triggers = {
    cambios = sha1(join("", [for f in fileset("${path.module}/../frontend", "*") : filesha1("${path.module}/../frontend/${f}")]))
  }
}

resource "docker_image" "back" {
  name = "back-app:1.0"

  build {
    context = "${path.module}/../backend"
  }

  triggers = {
    cambios = sha1(join("", [for f in fileset("${path.module}/../backend", "*") : filesha1("${path.module}/../backend/${f}")]))
  }
}

resource "docker_image" "postgres" {
  name         = "postgres:16-alpine"
  keep_locally = true
}