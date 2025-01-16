
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
    content = var.content
    file_permission = var.file_permission
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