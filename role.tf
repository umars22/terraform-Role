resource "aws_iam_role" "role" {
  name = "test-role"

  assume_role_policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
{
"Action": "sts:AssumeRole",
"Principal": {
"Service": "ec2.amazonaws.com"
},
"Effect": "Allow",
"Sid": ""
}
]
}
EOF
}


resource "aws_iam_policy" "admin-policy" {
    name = "admin"

    policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
{
"Effect": "Allow",
"Action": "*",
"Resource": "*"
}
]
}
EOF
}

resource "aws_iam_policy_attachment" "test-attach" {
    name = "test-attach"
    roles = ["${aws_iam_role.role.name}"]
    policy_arn = "${aws_iam_policy.admin-policy.arn}"
}

resource "aws_iam_instance_profile" "test_profile"{
    name = "test-profile"
    role = "${aws_iam_role.role.name}"
}