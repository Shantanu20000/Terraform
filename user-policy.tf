 provider "aws" {
   region = "us-east-1"
   access_key = ""
   secret_key = ""
 }
 resource "aws_iam_policy" "admin-policy" {
  name        = "admin-policy"
  path        = "/"
  description = "My admin policies"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "*"
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_user" "user-name" {
  name = "soham"
  path = "/home/"

  tags = {
    name = "soham"
  }
}

resource "aws_iam_access_key" "user-name" {
  user = "${aws_iam_user.user-name.name}"
}

resource "aws_iam_user_policy" "user-policy" {
  name   = "admin-policy"
  user   = "${aws_iam_user.user-name.name}"
  policy = "${aws_iam_user_policy.admin-policy.policy}"
}
