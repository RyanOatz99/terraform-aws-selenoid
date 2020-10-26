provider "aws" {
  region = "eu-west-1"
}

module "selenoid" {
  source          = "../../"
  spot_price      = "0.69"
  instance_type   = "c5.4xlarge"
  security_groups = var.security_groups
  subnet_id       = var.subnet_id
  cpu_count       = 16
  key_pair        = var.keypair
  instance_role   = var.instance_role

}

variable "security_groups" {
}
variable "subnet_id" {
}
variable "keypair" {
}
variable "instance_role" {
}

output "ip" {
  description = "description"
  value       = module.selenoid.private_ip
}
