resource "aws_instance" "ansible_ctrl_node" {
  ami           = "ami-0853d3a745e6fa2c3"
  instance_type = "t2.micro"
  security_groups = [ "EC2-Default-SG" ]
  user_data = <<EOF
  #!/bin/bash
  cd /home/ansible/
  git clone git@github.com:TalesNotTails/Ansible.git
  EOF
  tags = {
    Type = "Ansible Control Node"
  }
}
