# key pair for login - ssk-keygen

resource aws_key_pair app_key {
	key_name = "${var.env}-app-key"
	public_key = file("app-key.pub")

    tags = {
        Environment = var.env
    }
}

# creating vpc 
resource aws_default_vpc default {
	
}

# creating security group
resource aws_security_group my_sec_grp {
	name = "${var.env}-app-sg"
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

        tags = {
            Name = "${var.env}-app-sg"
        }
	}

    # ec2 instance

	resource aws_instance "terra" {
		count = var.instance_count
        
        depends_on = [aws_security_group.my_sec_grp, aws_key_pair.app_key]

        key_name = aws_key_pair.app_key.key_name
		security_groups= [aws_security_group.my_sec_grp.name]
		instance_type= var.instance_type
		ami = var.ec2_ami_id 
		# user_data = file("install_nginx.sh")

		root_block_device {
	        volume_size = var.env == "prd" ? 20 : 10
	        volume_type = "gp3"
        }
    tags = {
	    Name = "${var.env}-app"
        Environment = var.env
    }
}
