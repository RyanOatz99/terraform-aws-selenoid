output "private_ip" {
  description = "The private IP of the instance, you can use it to connect to the Selenium grid or to Selenoid UI on port 8080"
  value = aws_spot_instance_request.selenium.private_ip
}

output "instance_id" {
  description = "The ID of the instance"
  value       = aws_spot_instance_request.selenium.spot_instance_id
}

output "public_ip" {
  description = "The public IP of the instance."
  value       = aws_spot_instance_request.selenium.public_ip
}