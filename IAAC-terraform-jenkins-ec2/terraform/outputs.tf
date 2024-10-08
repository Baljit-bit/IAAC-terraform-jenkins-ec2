output "instance_ip" {
  value = aws_instance.ec2_app_server.public_ip
}
