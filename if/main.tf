terraform {
  required_version = ">= 0.13"
}

variable "name" {
  description = "A name to render"
  type        = string
  default     = "Wellth"
}

output "if_else_directive" {
  value = "Hello, %{if var.name != ""}${var.name}%{else}(unnamed)%{endif}"
}
