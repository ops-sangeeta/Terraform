resource "aws_dynamodb_table" "state-dynamodb-table" {
  name           = "state-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockId"
  

  attribute {
    name = "LockId"
    type = "S"
  }

  tags = {
    Name        = "state-table"
    
  }

}
