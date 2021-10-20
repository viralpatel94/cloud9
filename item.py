import boto3
import os

access_key = os.environ['ACCESS_KEY']
secret_key = os.environ['SECRET_KEY']
dynamodb = boto3.client('dynamodb', aws_access_key_id=access_key, aws_secret_access_key=secret_key)

dynamodb.put_item(TableName='client-environments',
    Item={'ClientName':{'S':'Banana'}}

    )
