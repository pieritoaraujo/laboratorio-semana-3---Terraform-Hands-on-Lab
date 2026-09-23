output "dev" {
  value = {
    frontend = "http://localhost:${var.puertos["dev"].web}"
    backend  = "http://localhost:${var.puertos["dev"].api}"
    bd       = "localhost:${var.puertos["dev"].bd}"
  }
}

output "qa" {
  value = {
    frontend = "http://localhost:${var.puertos["qa"].web}"
    backend  = "http://localhost:${var.puertos["qa"].api}"
    bd       = "localhost:${var.puertos["qa"].bd}"
  }
}