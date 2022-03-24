terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  backend "s3" {
      bucket    = "naughtydog-terraform-state"
      key       = "key/terraform.tfstate"
      region    = "eu-north-1"
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-north-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0dbef1af74414d054"
  instance_type = "t3.micro"

  tags = {
    Name = var.instance_name
  }
}
