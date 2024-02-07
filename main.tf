# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

## Terraform configuration

terraform {
  cloud {
    organization = "tcoyleaws"
    workspaces {
      name = "terraform-learning"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.28.0"
    }
  }
  required_version = ">= 1.1.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "tcoyleaws"
}

resource "aws_s3_bucket" "tom_bucket" {
  bucket        = "tcoyleawsbucket123423453"
  force_destroy = true

  tags = {
    name        = "Tom Bucket"
    environment = "Dev"
  }
}
/*
resource "aws_instance" "Terraform" {
  ami                    = "ami-0e9107ed11be76fde"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0fea779c1b49d5066"]
  key_name               = "coyleteast"

  tags = {
    Name        = "TF Test"
    environment = "Dev"
  }
}

output "ec2_public_ip" {
  value = aws_instance.Terraform.public_ip
}
*/