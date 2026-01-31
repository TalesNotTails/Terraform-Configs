resource "aws_ebs_volume" "volumes" {
  for_each  = {
    for k, v in var.servers : k => v
    if contains(var.requires_storage, k)
  }
  availability_zone = each.value.vol_az
  size              = each.value.vol_size
  type              = each.value.vol_type

  tags = {
    ManagedBy = "Terraform"
  }

  lifecycle {
    prevent_destroy = true
  }
}
