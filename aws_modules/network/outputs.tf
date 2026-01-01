output "subnet_ids" {
  description = "A map of subnet IDs"
  value       = {
    for k, subnet in aws_subnet.subnets : k => subnet.id 
  }
}

# If you're referencing security groups from another module
output "instance_sec_group_map" {
  description = "Map of instance names to their security group IDs"
  value = {
    for instance_name, instance in var.servers : 
      instance_name => [
        for sg_name in instance.sec_groups :
          aws_security_group.sec_groups[sg_name].id
      ]
  }
}
