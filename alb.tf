resource "aws_alb" "test" {
  name               = "alb-lc"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-091741c2ff0d8625c"]
  subnets            = ["subnet-0dd5c46ade5755d4c","subnet-059fe0bcccf938020"]

  enable_deletion_protection = false

  tags = {
    Name = "alb-lc"
  }
}


