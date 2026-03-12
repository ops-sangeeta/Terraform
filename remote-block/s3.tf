resource aws_s3_bucket balti {
	bucket = "state-bucket"

    tags ={
        Name = "remote-state-bucket"
    }
}
