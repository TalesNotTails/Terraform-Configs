resource "aws_ebs_volume" "volumes" {
  for_each = var.servers

  availability_zone = each.value.vol_az
  size              = each.value.vol_size
  type              = each.value.vol_type

  tags = {
    ManagedBy = "Terraform"
  }
}
