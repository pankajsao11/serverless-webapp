resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  table_class  = "STANDARD"
  #read_capacity  = 20
  #write_capacity = 20
  hash_key = "Email" #partition key
  #range_key = ["Name", "Phone", "password"]

  attribute {
    name = "Email"
    type = "S"
  }

  attribute {
    name = "Name"
    type = "S"
  }

  attribute {
    name = "Phone"
    type = "N"
  }

  attribute {
    name = "password"
    type = "S"
  }

  global_secondary_index {
    name     = "EmailIndex"
    hash_key = "Email"
    #range_key          = "TopScore"
    write_capacity  = 20
    read_capacity   = 20
    projection_type = "KEYS_ONLY"
    #non_key_attributes = ["Name", "Phone", "Password"]
  }

  global_secondary_index {
    name            = "NameIndex"
    hash_key        = "Name"
    write_capacity  = 20
    read_capacity   = 20
    projection_type = "KEYS_ONLY"
    #non_key_attributes = ["Email", "Phone", "Password"]
  }
  global_secondary_index {
    name            = "PhoneIndex"
    hash_key        = "Phone"
    write_capacity  = 20
    read_capacity   = 20
    projection_type = "KEYS_ONLY"
    #non_key_attributes = ["Name", "Email", "Password"]
  }
  global_secondary_index {
    name            = "PasswordIndex"
    hash_key        = "password"
    write_capacity  = 20
    read_capacity   = 20
    projection_type = "KEYS_ONLY"
    #non_key_attributes = ["Name", "Phone", "Email"]
  }

  tags = {
    Name        = "webapp-db-table"
    Environment = "development"
  }
}

output "table_name" {
  value = aws_dynamodb_table.basic-dynamodb-table.name
}