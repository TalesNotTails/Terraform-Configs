output "ebs_vol_ids" {
  description = "A map of instance IDs created by the for_each loop"
  value = {
    for k, vol in aws_ebs_volume.volumes : k => vol.id
  }
}

output "ebs_vol_azs" {
  description = "A map of instance AZs created by the for_each loop"
  value = {
    for k, vol in aws_ebs_volume.volumes : k => vol.availability_zone
  }
}

output "ebs_vol_arns" {
  description = "A map of instance ARNs created by the for_each loop"
  value = {
    for k, vol in aws_ebs_volume.volumes : k => vol.arn
  }
}
