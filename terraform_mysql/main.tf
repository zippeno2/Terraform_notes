terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.47.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

provider "random" {
  # Configuration options
}

resource "random_password" "password" {
  length = 20
  special = true
  override_special = "_%@"
}

resource "aws_db_instance" "default" {
  allocated_storage    = 50
  engine               = "mysql"
  engine_version       = "8.0.25"
  instance_class       = "db.t2.micro"
  name                 = "db001"
  username             = "dbadmin1"
  password             = random_password.password.result
  skip_final_snapshot  = true
}~
