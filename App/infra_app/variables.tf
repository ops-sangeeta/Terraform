variable env {
description ="environment ready"
type = "string"

}

variable bucket_name {
description ="bucket fot env"
type = "string"

}

variable "instance_count" {
  description = "This is no of instance"
  type = number
}

variable "instance_type" {
  description = "This is type of instance"
  type = string
}

variable "ec2_ami_id" {
  description = "This is type of instance"
  type = string
}

variable "hash_key" {
  description = "This is hash key"
  type = string
}