# this 1st and the most basic terraform script 
# creating a txt file using terraform

resource "local_file" "intro" {
  filename = "/home/prithvi/terraform-practice/practice_1/hello.txt"
  content  = "Hi, my name is prithvi"
}
