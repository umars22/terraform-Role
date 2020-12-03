resource "aws_instance" "web" {
  ami                         = "${data.aws_ami.centos.id}"
  instance_type               = "t3.micro"
  associate_public_ip_address = "true"
  key_name                    = "${aws_key_pair.class.key_name}"
  iam_instance_profile = "${aws_iam_instance_profile.test_profile.name}"
}
