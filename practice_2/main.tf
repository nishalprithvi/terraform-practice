# here in this terraform script trying to use variables in terraform script to make the script resuable again & again

resource "local_file" "pet" {
    filename = var.filename
    content = var.content
  
}

resource "random_pet" "my-pet" {
    prefix = var.prefix
    separator = var.separator
    length = var.length
  
}