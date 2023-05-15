# trying to read a local data source not created or managed by the terraform 

resource "local_sensitive_file" "pet" {
    filename = "/home/prithvi/terraform-practice/practice_6/pets.txt"
    content = data.local_file.dog.content  # reffering the datasource content 

    #format for reffering =  data.resource_type.resource_name.resource_attribute
  
}

data "local_file" "dog" {
    filename = "/home/prithvi/terraform-practice/practice_6/sample.txt"  # data source here mentions the data source to be refferef from
}