data "terraform_remote_state" "base_infra" {
  backend = "s3"

  config = {
    bucket = var.state_bucket
    key    = var.state_key
    region = var.aws_region
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
