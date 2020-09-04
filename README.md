# hello-world-api

## Overview
Gets a hello world string and the current date and time from a generated endpoint.

## Requirements and Dependencies

- Pre-existing s3 bucket for storing terraform state. With the following permissions:
   *   s3:ListBucket
   *   s3:GetObject
   *   s3:PutObject
   
Add the bucket name and the path to where you would like to store the logs in     

# Assumptions and expected environment
Developed using Python 3.8 and Terraform 13.3 


# IAM policies
There is one IAM policy for logging to cloudwatch.

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
```

# API Examples
`GET http://<aws_generated_url>/hello-world`  

# Deployment instructions 
Dockerfile. 