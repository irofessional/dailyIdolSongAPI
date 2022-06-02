locals {
  hash_key_name  = "IdolType"
  range_key_name = "IdolName"
}

resource "aws_dynamodb_table" "idol_table" {
  name         = "idolGroupList"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = local.hash_key_name
  range_key    = local.range_key_name

  attribute {
    name = local.hash_key_name
    type = "S"
  }

  attribute {
    name = local.range_key_name
    type = "S"
  }

  attribute {
    name = "UserDefinedIdolCategory"
    type = "S"
  }


  global_secondary_index {
    name            = "getByIdolName"
    hash_key        = local.range_key_name
    projection_type = "INCLUDE"
    non_key_attributes = [
      "getByUserDefinedCategory",
      "spotifyId",
      "spotifyClientUrl",
      "spotifyApiUrl"
    ]
  }

  global_secondary_index {
    name            = "getByUserDefinedCategory"
    hash_key        = "UserDefinedIdolCategory"
    projection_type = "INCLUDE"
    non_key_attributes = [
      local.range_key_name,
      "spotifyId",
      "spotifyClientUrl",
      "spotifyApiUrl"
    ]
  }

}
