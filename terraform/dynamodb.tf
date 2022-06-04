resource "aws_dynamodb_table" "idol_table" {
  name         = "idolGroupList"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "idolIdentifer"
  range_key    = "dataType"

  attribute {
    name = "idolIdentifer"
    type = "S"
  }

  attribute {
    name = "dataType"
    type = "S"
  }

  attribute {
    name = "dataValue"
    type = "S"
  }

  global_secondary_index {
    name            = "getByDataValue"
    hash_key        = "dataValue"
    range_key       = "idolIdentifer"
    projection_type = "ALL"
  }


  global_secondary_index {
    name            = "getByDataType"
    hash_key        = "dataType"
    range_key       = "dataValue"
    projection_type = "INCLUDE"
    non_key_attributes = [
      "idolIdentifer",
    ]
  }

}
