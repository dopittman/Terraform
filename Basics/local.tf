
/* 
<BlockName> "<ResourceType>" "<ResourceName>" {
    <ResourceAttribute> = <Value>
}

In "local_file" that is actually 2 pieces of infotmation
local = provider
file = resource

*/

resource "local_file" "pet" {
    filename = var.filename
    content = "My favorite pet is ${random_pet.my-pet.id}"
    file_permission = var.file_permission
     # already has an implicit dependency on the local_file.pet resource but we can also add an explicit dependency
    depends_on = [random_pet.my-pet]

}

resource "random_pet" "my-pet" {
    prefix = var.prefix[2]
    separator = var.separator
    length = var.length
}

/*
We can then run `terraform init` to initialize the local provider and  ``terrafom plan` to basically stage and plan out the changes, 
then terraform apply` to make the changes that were planned.
*/

/*
Running terraform apply after making a change destroys the existing resource and creates a new one.
*/

/*
`terraform delete` will delete the resource
*/