resource "aws_instance" "instances" {
  for_each                    = var.servers
  availability_zone           = var.vol_azs[each.key]
  instance_type               = each.value.inst_type
  subnet_id                   = var.subnet_ids[each.value.subnet]
  ami                         = each.value.inst_ami
  vpc_security_group_ids      = var.sec_group_ids[each.key]
  root_block_device {
    delete_on_termination = true
  }
  tags  = each.value.tags
}

resource "aws_volume_attachment" "ebs_att" {
  for_each    = var.servers
  device_name = "/dev/sdb"
  volume_id   = var.vol_ids[each.key]
  instance_id = aws_instance.instances[each.key].id
}

resource "aws_eip" "eips" {
  for_each  = var.servers
  instance  = aws_instance.instances[each.key].id
  domain    = "vpc"
}
