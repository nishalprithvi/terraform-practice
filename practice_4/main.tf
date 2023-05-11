#explicit resource dependency  
resource "local_file" "whale" {
    filename = "/home/prithvi/terraform-practice/practice_4/whale.txt"
    content = "whale"
    depends_on = [local_file.krill]
  
}
# here nonde of the attribute of whale depends on krill but whale depends on krill , hence to create such dependecies we use "depends_on" attribute to define the dependency b/w resources
# the dependency defined is known as ecplicit dependency.

resource "local_file" "krill" {
    filename = "/home/prithvi/terraform-practice/practice_4/krill.txt"
    content = "krill"
  
}
