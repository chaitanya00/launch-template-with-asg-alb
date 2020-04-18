resource "aws_autoscaling_group" "asg-1" {
  name                 =  "asg-lt"
  min_size             = 1
  max_size             = 3
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  vpc_zone_identifier = ["subnet-095dddd3ae1f8851f","subnet-061487ed4c609d81c"]
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
