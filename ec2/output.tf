output "ec2_pub_ip" {
    value = aws_instance.terra.public_ip
}

output "ec2_pub_dns" {
    value = aws_instance.terra.public_dns
}

output "ec2_pri_ip" {
    value = aws_instance.terra.private_ip
}

#output for for_each
#output "ec2_pub_ip" {
#    value = [
#        for instance in aws_aws_instance.terra : instance.public_ip
#    ]
#}