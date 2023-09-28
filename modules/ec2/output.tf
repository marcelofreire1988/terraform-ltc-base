output "ec2_global_ips" {
  value = aws_instance.linux_tips.*.public_ip
}
