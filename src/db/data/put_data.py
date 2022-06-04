import json
import boto3
import decimal

TABLE_NAME = 'idolGroupList'
FILE_PATH = '/home/cafecat6503/dailyIdolSongAPI/src/db/data/alt-idol.json'

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(TABLE_NAME)


def put_items_dynamodb():
   items = convert_json_dict(FILE_PATH)

   try:
       with table.batch_writer() as batch:
           for i in items:
               batch.put_item(
                   Item=i
               )
   except Exception as e:
       print(e)


def convert_json_dict(json_file_path):
   with open(json_file_path) as f:
       json_ = json.load(f, parse_float=decimal.Decimal)

   return json_


if __name__ == "__main__":
    put_items_dynamodb()