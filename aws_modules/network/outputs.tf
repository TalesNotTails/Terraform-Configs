output "subnet_ids" {
  description = "A map of subnet IDs"
  value       = {
    for k, subnet in aws_subnet.subnets : k => subnet.id 
  }
}
