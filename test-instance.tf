
data "template_file" "user_data" {
  template = file("${path.module}/vault.sh")
#   vars = {
#     account_id = "${var.account_id}"
#   }
}

resource "aws_instance" "vaultserver" {                    
  ami                         = var.ami 
  instance_type               = "t2.micro"
  key_name                    = var.key
  vpc_security_group_ids      = [aws_default_security_group.default_sg_vpc.id]
  associate_public_ip_address = true
  user_data                   = data.template_file.user_data.rendered

  tags = {
    Name = "${var.prefix}-test-instance"
  }
}