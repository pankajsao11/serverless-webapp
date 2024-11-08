resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "webapp-DbTable"
  table_class    = "STANDARD"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "email" #partition key

  attribute {
    name = "email"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }

  attribute {
    name = "TopScore"
    type = "N"
  }

  tags = {
    Name        = "webapp-db-table"
    Environment = "development"
  }
}