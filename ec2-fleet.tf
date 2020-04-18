resource "aws_ec2_fleet" "test" {
  launch_template_config {
    launch_template_specification {
      launch_template_id = "${aws_launch_template.test.id}"
      version            = "${aws_launch_template.test.latest_version}"
    }
  
     override {
      instance_type     = "t3.nano"
      weighted_capacity = 1
    }

    override {
      instance_type     = "t2.nano"
      weighted_capacity = 2
    }
  }

  target_capacity_specification {
    default_target_capacity_type = "spot"
    total_target_capacity        = 3
    on_demand_target_capacity = 2
    spot_target_capacity = 1
  }

}

