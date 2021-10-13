variable "rg" {
  type = object({
    name     = string
    location = string
    tags = object({
      Owner       = string
      Location    = string
      Environment = string
    })
  })
  description = "This variable must be called and assigned data at root directory main.tf"
}