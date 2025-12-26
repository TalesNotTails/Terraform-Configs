output "bois_ebs_id" {
  description = "The ID of the ebs volume for the bois mc server"
  value = aws_ebs_volume.bois_mc_vol.id
}

output "bois_az" {
  description = "The availability zone of the bois mc server ebs vol"
  value = aws_ebs_volume.bois_mc_vol.availability_zone
}
