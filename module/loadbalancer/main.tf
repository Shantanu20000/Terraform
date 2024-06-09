resource "aws_alb" "alb" {
  name               = var.name
  internal           = false
  load_balancer_type = "application"
  security_groups  =   var.my_security_group_id
  subnets            = var.my_subnet_id
# depends_on = [ vpc.vpc_id ]
# vpc_id =var.vpc_id
  enable_deletion_protection = false
}

resource "aws_lb_target_group" "target_group" {
  name        = var.target_group_name
  port        = 80
  protocol    = var.protocol
  vpc_id      = var.vpc_id  
  target_type = "instance"
    health_check {
    enabled             = true
    interval            = 30
    timeout             = 5  
    path                = "/"
    port                = 80
    protocol            = "HTTP"
    healthy_threshold   = 2  
    unhealthy_threshold = 2
    matcher             = "200"
  }
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_alb.alb.arn
  port              = 80
  protocol          = var.protocol
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

# resource "aws_lb_target_group_attachment" "target_attachment" {
#   # count = length(module.my_instances1.instance_ids)
#   target_group_arn = aws_lb_target_group.target_group.arn
#   target_id        = aws_lb_target_group.target_group.id # Replace with your target instance ID
# }

# resource "aws_lb_target_group_attachment" "target_attachment" {
#   target_group_arn = aws_lb_target_group.target_group.arn
#   target_id        = aws_instance.my_instances2[count.index].id  
#   // Replace "aws_instance.example.id" with the correct instance ID of your EC2 instance
# }

# resource "aws_lb_target_group_attachment" "target_attachment" {
#   for_each         = { for idx, instance in aws_instance.my_instances2 : idx => instance.id }
#   target_group_arn = aws_lb_target_group.target_group.arn
#   target_id        = each.value
# }
