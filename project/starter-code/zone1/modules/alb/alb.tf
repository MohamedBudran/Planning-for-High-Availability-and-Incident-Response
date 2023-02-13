#CODE REFRENCE:
#https://skundunotes.com/2022/07/30/add-an-application-load-balancer-to-aws-ec2-using-terraform/

# Step 1: Create a target group

resource "aws_lb_target_group" "udacityTGeast" {
  name     = "udacity-lb-east2"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

# Step 2: Attach the target group to the AWS instances
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment
resource "aws_lb_target_group_attachment" "udacity" {
  count            = 3     
  target_group_arn = aws_lb_target_group.udacityTGeast.arn
  target_id        = var.ec2.*.id[count.index]
  port             = 80
}

# Step 3: Create the load balancer
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb
#############################
resource "aws_lb" "udacity" {
  name               = "udacity-lb-alb-east-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.ec2_sg]
  subnets            = var.subnet_id

  enable_deletion_protection = false

}


# Step 4: Create a listener
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener

resource "aws_lb_listener" "udacity" {
  load_balancer_arn = aws_lb.udacity.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.udacityTGeast.arn
  }
}