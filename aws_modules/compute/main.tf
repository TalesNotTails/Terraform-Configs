resource "aws_instance" "instances" {
  for_each                    = var.servers
  availability_zone           = lookup(var.vol_azs, each.key, "us-east-1a")
  instance_type               = each.value.inst_type
  subnet_id                   = var.subnet_ids[each.value.subnet]
  ami                         = each.value.inst_ami
  vpc_security_group_ids      = var.sec_group_ids[each.key]
  associate_public_ip_address = each.value.public_ip
  root_block_device {
    delete_on_termination = true
  }
  tags  = each.value.tags
}

resource "aws_volume_attachment" "ebs_att" {
  for_each  = {
    for k, v in var.servers : k => v
    if contains(var.requires_eip, k)
  }
  device_name = "/dev/sdb"
  volume_id   = var.vol_ids[each.key]
  instance_id = aws_instance.instances[each.key].id
}

resource "aws_eip" "eips" {
  for_each  = {
    for k, v in var.servers : k => v
    if contains(var.requires_eip, k)
  }
  # instance  = aws_instance.instances[each.key].id
  domain    = "vpc"
}

resource "aws_eip_association" "eip_assoc" {
  for_each  = {
    for k, v in var.servers : k => v
    if contains(var.requires_eip, k)
  }
  instance_id = aws_instance.instances[each.key].id
  allocation_id = aws_eip.eips[each.key].id
}
