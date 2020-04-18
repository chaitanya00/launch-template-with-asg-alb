resource "aws_key_pair" "my1key" {
  key_name   = "my1key"
  public_key = "${file("my1key.pub")}"
}


resource "aws_launch_template" "test" {
  name          = "lt1"
  image_id      = "ami-07ebfd5b3428b6f4d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0f619344375c910f2"]
  key_name = "${aws_key_pair.my1key.key_name}"

  user_data = "${base64encode("${file("script.sh")}")}"

connection {
    user = "ubuntu"
    private_key = "${file("my1key")}"
  }
lifecycle {
    create_before_destroy = true
  }
}


