import datetime
import json

current_time = datetime.datetime.now()


def main_handler(event, context):
    return {
        "statusCode": 200,
        "body": json.dumps('hello world' + str(current_time))
    }


