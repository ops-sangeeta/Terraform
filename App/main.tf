#dev infra

module "dev-infra" {
source = "./infra_app"
env = "dev"
bucket_name = "infra-bucket"
instance_count = 1
instance_type = "t2.micro"
ec2_ami_id = ""
hash_key = "myId"
}

#Prod infra

module "prd-infra" {
source = "./infra_app"
env = "prd"
bucket_name = "infra-bucket"
instance_count = 2
instance_type = "t2.medium"
ec2_ami_id = ""
hash_key = "myId"
}

#stg infra

module "stg-infra" {
source = "./infra_app"
env = "stg"
bucket_name = "infra-bucket"
instance_count = 1
instance_type = "t2.small"
ec2_ami_id = ""
hash_key = "myId"
}