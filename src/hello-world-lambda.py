import datetime
import json


def main_handler(event, context):
    current_time = datetime.datetime.now().ctime()
    response = "Hello World! It'ster " + str(current_time)
    print(response)
    return {
        "statusCode": 200,
        "body": json.dumps(response)
    }


