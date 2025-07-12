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