terraform {
  required_version = ">= 0.13"
}

provider "aws" {
  region = "us-east-2"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

// COUNT______________________
variable "user_name_prefix" {
  description = "The prefix to use for the user name"
  type        = string
  default     = "user"
}

resource "aws_iam_user" "example" {
  count = length([1, 2, 3]) == 2 ? 5 : 0


  name = "${var.user_name_prefix}.${count.index}"
}








// FOR LOOP____________
variable "names" {
  description = "A list of names"
  type        = list(string)
  default     = ["Alice", "Bob", "Charles"]
}


output "upper_names" {
  value = [for name in var.names : upper(name)]
}

output "short_upper_names" {
  value = [for name in var.names : upper(name) if length(name) < 5]
}

// MAP__________
variable "name_job_map" {
  description = "map"
  type        = map(string)
  default = {
    Alice = "Engineer"
    Bob   = "Teacher"
    Chuck = "Mayor"
  }
}


output "bios" {
  value = [for name, role in var.name_job_map : "${name} is the ${role}"]
}

output "upper_roles" {
  value = { for name, role in var.name_job_map : upper(name) => upper(role) }
}
