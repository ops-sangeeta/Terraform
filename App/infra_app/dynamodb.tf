resource "aws_dynamodb_table" "state-dynamodb-table" {
  name           = "${var.env}-app-state-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.hash_key
  

  attribute {
    name = var.hash_key
    type = "S"
  }

  tags = {
    Name        = "${var.env}state-table"
    Environment = var.env
    
  }

}