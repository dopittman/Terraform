variable "filename" {
    default = "./pets.txt"
    type = string
}

variable "content" {
    default = "My favorite pet is a dog"
    type = string
}

variable "file_permission" {
    default = "0700"
    type = string
}

variable "prefix" {
    default = ["Mr", "Mrs", "Sir"]
    type = list(string)
}

variable "separator" {
    default = "."
    type = string
}

variable "length" {
    default = 2
    type = number
}

variable "dog" {
    type = object({
      name = string
      age = number
      breed = string
      color = string
      food = list(string)
      favorite_pet = bool
    })
    default = {
      name = "bella",
      age = 2,
      breed = "labrador",
      color = "black",
      food = ["meat", "bones"],
      favorite_pet = true  
    }
}