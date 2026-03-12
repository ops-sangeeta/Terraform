resource aws_key_pair key {
	key_name = "ec2"
	public_key = file("ec2.pub") 
}
resource aws_default_vpc default {
	
}
resource aws_security_group my_sec_grp {
	name = "sg"
	description = "new_sg"
	vpc_id = aws_default_vpc.default.id			
	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = [ "0.0.0.0/0" ]
		description = "inbound rules - ssh"
	}

	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = [ "0.0.0.0/0" ]
		description = "inbound rules - http"
	}

	egress {
		to_port = 0
		from_port = 0
		protocol = -1		
		cidr_blocks = [ "0.0.0.0/0" ]
        	description = "outbound rules"
		}
	}
	resource aws_instance "terra" {
		key_name= aws_key_pair.key.key_name
		security_groups= [aws_security_group.my_sec_grp.name]
		instance_type= var.ec2_instance_type
		ami = var.ec2_ami_id 
		user_data = file("install_nginx.sh")

		root_block_device {
	        volume_size = var.ec2_storage_size
	        volume_type = "gp3"
        }
    tags = {
	    name = "terra_automate"
    }
}
