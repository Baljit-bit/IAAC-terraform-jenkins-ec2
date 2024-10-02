output "jenkins_master_ip" {
  value = aws_instance.master_app_server.public_ip
}

output "jenkins_slave_ip" {
  value = aws_instance.slave_app_server.public_ip
}
