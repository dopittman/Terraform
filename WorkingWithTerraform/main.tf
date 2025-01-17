/*
 - Lifecycle arguments are used to control when a resource is created, updated, or deleted.
 - Data sources allow data to be fetched or computed for use elsewhere in Terraform configuration.
*/

resource "local_file" "pet" {
    filename = var.filename[count.index]
    content = "My favorite pet is ${random_pet.my-pet.id}"
    file_permission = var.file_permission
     # already has an implicit dependency on the local_file.pet resource but we can also add an explicit dependency
    depends_on = [random_pet.my-pet]

    count = length(var.filename)

    # lifecycle {
        # create_before_destroy = true
        // This will create the new resource before destroying the old one
        // Other Lifecycle blocks include:
        // ignore_changes - Ignore changes to resource attributes
        // prevent_destroy - Prevent the resource from being destroyed
    # }
}

resource "random_pet" "my-pet" {
    prefix = var.prefix[2]
    separator = var.separator
    length = var.length
}

// Datasource example
data "local_file" "dog" {
    filename = "./dog.txt"
}

// Using the data source
resource "local_file" "pet-dog" {
  filename = "./MyDog"
  content = data.local_file.dog.content
}