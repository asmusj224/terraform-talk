terraform {
  required_version = ">= 0.13, < 0.14"
}

provider "aws" {
  region = "us-east-2"

  version = "~> 2.0"
}

module "webserver_cluster" {
  source = "../services/webserver-cluster"

  cluster_name = var.cluster_name

  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 2
}
