resource "aws_instance" "linux_tips" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.tag_name
  }
}