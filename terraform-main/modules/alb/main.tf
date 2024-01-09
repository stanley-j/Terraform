#Create an ALB target group
resource "aws_lb_target_group" "alb-TG" {
  name     = var.name
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id
}

#Create Load balancer
resource "aws_lb" "my-aws-alb" {
  name               = var.name_lb
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = [var.my_vpc_sg_id]
  subnets            = [var.pub1_sub_id, var.pub2_sub_id]
}

# Create Load balancer listner rule
resource "aws_lb_listener" "lb_lst" {
  load_balancer_arn = aws_lb.my-aws-alb.arn
  port              = var.port_lb_l
  protocol          = var.protocol_lb_l

  default_action {
    type             = var.type
    target_group_arn = aws_lb_target_group.alb-TG.arn
  }
}

#Load balancer-Target group attachment
resource "aws_lb_target_group_attachment" "my-aws-alb" {
  target_group_arn = aws_lb_target_group.alb-TG.arn
  target_id        = var.pub1_ec2_id
  port             = var.port_lb
}

#Load balancer-Target group attachment
resource "aws_lb_target_group_attachment" "my-aws-alb2" {
  target_group_arn = aws_lb_target_group.alb-TG.arn
  target_id        = var.pub2_ec2_id
  port             = var.port_lb_attach
} 
