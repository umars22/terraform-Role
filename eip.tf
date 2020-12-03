resource "aws_eip" "lb" {
  vpc = true
  instance = "${aws_instance.web.id}"

}