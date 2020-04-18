resource "aws_alb" "test" {
  name               = "alb-lc"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-0f619344375c910f2"]
  subnets            = ["subnet-061487ed4c609d81c","subnet-095dddd3ae1f8851f"]

  enable_deletion_protection = false

  tags = {
    Name = "alb-lc"
  }
}


