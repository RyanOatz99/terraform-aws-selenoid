
variable "security_groups" {
  type        = list(string)
  description = "The list of security groups to assign to the instance"
}

variable "subnet_id" {
  description = "The ID of the subnet to create the instance in"
}

variable "ami-id" {
  default     = "ami-01e9e007e7af05e9f"
  description = "The AMI to use to create the instance. By default the RancherOS AMI is used but any AMI that has docker pre-installed and fully supports cloud-init should work"
}

variable "spot_price" {
  description = "The spot price for the spot instance request"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for the Selenoid instance"

}

variable "key_pair" {
  description = "The key pair to use in case you want to SSH into the instance"
  default     = null
}

variable "instance_role" {
  description = "The instance role for the Selenoid instance"
  default     = null
}

variable "spot_type" {
  description = "The spot type"
  default     = "persistent"
}

variable "tags" {
  description = "The tags for the spot request (not the instance)"
  type        = map
  default     = {}
}

variable "cpu_count" {
  description = "The number of CPU's of the instance. This will be passed to Selenoid as --limit CLI parameter. This tell Selenoid how many concurrent containers it can run. You should assign a value according to the number of CPU's of the instance type."
  type        = number
}

variable "browsers" {
  description = "The browsers that you want to support in the Selenium Grid. For valid options please refer to the Selenoid documentation. The default value will setup a grid for Chrome and Firefox."
  default     = "firefox;chrome"
}


