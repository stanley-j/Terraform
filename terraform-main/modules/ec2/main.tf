resource "aws_instance" "Pub2a_ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id                   = var.pub1_sub_id
  security_groups             = [var.my_vpc_sg_id]

  user_data = filebase64("./modules/ec2/config_1.sh")
}

resource "aws_instance" "Pub2b_ec2" {
  ami                         = var.ami_ec2
  instance_type               = var.instance_type_ec2
  associate_public_ip_address = var.associate_public_ip_address_ec2
  subnet_id                   = var.pub2_sub_id
  security_groups             = [var.my_vpc_sg_id]

  user_data = filebase64("./modules/ec2/config_2.sh")
}



