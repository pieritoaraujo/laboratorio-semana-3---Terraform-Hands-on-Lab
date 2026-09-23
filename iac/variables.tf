variable "puertos" {
  description = "Puertos externos por entorno"
  type = map(object({
    web = number
    api = number
    bd  = number
  }))
}