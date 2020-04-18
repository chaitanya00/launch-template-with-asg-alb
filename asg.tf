resource "aws_autoscaling_group" "asg-1" {
  name                 =  "asg-lt"
  min_size             = 1
  max_size             = 3
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  vpc_zone_identifier = ["subnet-0dd5c46ade5755d4c","subnet-059fe0bcccf938020"]
  tag {
    key                 = "Name"
    value               = "asg-lt"
     propagate_at_launch = true  
  }  
  launch_template {
    id      = "${aws_launch_template.test.id}"
    version = "$Latest"
  }
  lifecycle {
    create_before_destroy = true
  }
}
