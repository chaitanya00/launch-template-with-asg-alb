resource "aws_route53_zone" "test" {
  name         = "charu.com."
  vpc {
    vpc_id = "vpc-041b1db3d1f6cdd8a"
  }
  lifecycle {
    ignore_changes = ["vpc"]
  }
}

resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.test.zone_id}"
  name    = "www.${aws_route53_zone.test.name}"
  type    = "A"

  alias {
    name                   = "${aws_alb.test.dns_name}"
    zone_id                = "${aws_alb.test.zone_id}"
    evaluate_target_health = false
  }
}
