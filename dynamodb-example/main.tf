resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "party"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "PartyID"

  attribute {
    name = "PartyID"
    type = "S"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  global_secondary_index {
    name               = "FirstName"
    hash_key           = "FirstName"
    write_capacity     = 5
    read_capacity      = 5
    projection_type    = "ALL"    
  }

  attribute {
    name = "FirstName"
    type = "S"
  }

  tags = {
    Name        = "party"
    Environment = "dev"
  }
}