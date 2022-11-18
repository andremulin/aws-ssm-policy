# Create Role
resource "aws_iam_role" "ssm_ec2" {
  name = "ssm-ec2-role-${var.name}"
  path = "/"

  assume_role_policy = data.aws_iam_policy_document.assume_role_policy_doc.json
}

# Create Policy
resource "aws_iam_policy" "ssm_ec2" {
  name = "ssm-ec2-policy-${var.name}"
  path = "/"

  policy = data.aws_iam_policy_document.ssm_ec2.json
}

# Attachment policy
resource "aws_iam_role_policy_attachment" "ssm_ec2" {
  role       = aws_iam_role.ssm_ec2.name
  policy_arn = aws_iam_policy.ssm_ec2.arn
}

# Create IAM Instance Profile
resource "aws_iam_instance_profile" "ssm_ec2" {
  name = "ssm-ec2-${var.name}"
  role = aws_iam_role.ssm_ec2.name
}