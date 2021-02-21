output "ec2_loadbalancer" {
  description = "The address of the EC2 instance loadbalancer"
  value       = aws_instance.linux-lb.public_ip
}
output "ec2_backend1" {
  description = "The address of the EC2 instance node1"
  value       = aws_instance.linux-node1.public_ip
}
output "ec2_backend2" {
  description = "The address of the EC2 instance node2"
  value       = aws_instance.linux-node2.public_ip
}