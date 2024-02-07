# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

## Terraform configuration

terraform {
  /*cloud {
    organization = "tcoyleaws"
    workspaces {
      name = "learn-terraform-cloud-migrate"
    }
  }
*/
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.28.0"
    }
  }
  required_version = ">= 1.1.0"
}

variable "name_length" {
  description = "The number of words in the pet name"
  default     = "3"
}

resource "random_pet" "pet_name" {
  length    = var.name_length
  separator = "-"
}

output "pet_name" {
  value = random_pet.pet_name.id
}

resource "aws_s3_bucket" "tom_bucket" {
  bucket        = "tcoyleawsbucket123423453"
  force_destroy = true

  tags = {
    name        = "Tom Bucket"
    environment = "Dev"
  }
}
