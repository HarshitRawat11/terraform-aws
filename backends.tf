# --- root/backends.tf ---

terraform {
  cloud {
    organization = "harshit-rawat-devops"

    workspaces {
      name = "terraform-aws"
    }
  }
}