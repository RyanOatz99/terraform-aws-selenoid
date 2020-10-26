resource "aws_spot_instance_request" "selenium" {
  ami                    = var.ami-id
  spot_price             = var.spot_price
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_groups
  subnet_id              = var.subnet_id
  key_name               = var.key_pair
  iam_instance_profile   = var.instance_role
  user_data = templatefile("${path.module}/rancher-cloud-config.yml", {
    browsers = var.browsers,
    limit    = var.cpu_count
  })
  spot_type            = var.spot_type
  wait_for_fulfillment = "true"

  tags = var.tags

}

