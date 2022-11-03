variable "amis" {
    type = "map"
    default = {
        "us-east-1" = "ami-83065c"
        "us-east-2" = "ami-83065sssss2"
    }
  
}

variable "cdirblocks" {
    type = "list"
    default = ["45.191.13", "48.191.13"]
    }
  
variable "key_name" {
    default = "terraform-aws"
    }
    