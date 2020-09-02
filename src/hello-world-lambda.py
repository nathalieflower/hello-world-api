import datetime
import json


def main_handler(event, context):
    current_time = datetime.datetime.now()
    return {
        "statusCode": 200,
        "body": json.dumps('Hello World : ' + str(current_time))
    }


