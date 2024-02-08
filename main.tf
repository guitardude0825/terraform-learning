
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
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "tcoyleaws"
}

provider "azurerm" {
  features {}
}
/*
resource "aws_s3_bucket" "tom_bucket" {
  bucket        = "tcoyleawsbucket123423453"
  force_destroy = true

  tags = {
    name        = "Tom Bucket"
    environment = "Dev"
  }
}

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

resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "eastus"
}

resource "azurerm_virtual_network" "tc-vnet" {
  name                = "coyle-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "tc-subnet-1" {
  name                 = "coyle-subnet1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.tc-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

output "ec2_public_ip" {
  value = aws_instance.Terraform.public_ip
}
*/