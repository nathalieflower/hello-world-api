# hello-world-api

## Overview
Gets a hello world string and the current date and time from a generated endpoint. It logs all calls to cloudwatch for logging and monitoring purposes.

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

# Deployment and Running Instructions 
I would have liked to have built a full deployment pipeline, sadly due to time constraints I didn't get it done. Have a few ideas I would like to discuss at interview though.

My short term solution is: 

Ensure you have variables configured in your ~/.aws/credentials file (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html?icmpid=docs_sso_user_portal)

I have included a docker file that can be built with the following command:

`sudo docker build -t hello-world:latest .`  

and then can be run with
`sudo docker run hello-world -v home/nathalie/.aws/credentials:/root/.aws/credentials:ro `

After the script has run it will output a url that will take you to the solution.