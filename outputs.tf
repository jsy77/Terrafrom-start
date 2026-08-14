output "secrity_group_name" {
  value = aws_security_group.ec2_sg.name

}

output "secrity_group_id" {
  value = aws_security_group.ec2_sg.id
}
