resource "aws_instance" "ansible_managed_node" {
  ami           = "ami-06144ff60778ea372"
  instance_type = "t2.micro"
  security_groups = [ "EC2-Default-SG" ]
}
