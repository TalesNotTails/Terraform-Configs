resource "aws_key_pair" "ssh_key" {
  key_name   = "Macbook Key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB4mTLwN2A7Cnj80ftMrriRZ+lXIU7cCZKcNOH7lo7BD csariaslani@Cyruss-MacBook-Pro.local"
}

resource "aws_security_group" "example" {
  name        = "EC2-Default-SG"
  description = "Default SG for EC2 instances"
  tags = {
    Name = "example"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.example.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv4" {
  security_group_id = aws_security_group.example.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.example.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.example.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_https_ipv4" {
  security_group_id = aws_security_group.example.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.example.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_instance" "example_server" {
  ami           = "ami-00963c6c64afa4994"
  instance_type = "t2.micro"
  key_name = "Macbook Key"
  user_data = <<EOF
#!/bin/bash
rhc connect --activation-key activation-key-default-su4zls --organization 19207058
EOF
  security_groups = [ "EC2-Default-SG" ]
  tags = {
    name = "testVM"
  }
}