#!/bin/bash

set -x

PRO=${AWS_PROFILE}
RG=${AWS_REGION}
bucket=workspace-tfstate-${RG}

echo "AWS PROFILE : $PRO"
echo "AWS REGION  : $RG"
echo "Bucket	  : $bucket"

echo ""

echo "Create the bucket with AWS CLI:"
`aws s3api create-bucket --bucket $bucket --region ${RG} \
--create-bucket-configuration LocationConstraint=${RG}` > /dev/null 2>&1

echo "Enable versioning:"
`aws s3api put-bucket-versioning --bucket ${bucket} \
--versioning-configuration Status=Enabled`

echo "Enable encryption:"
`aws s3api put-bucket-encryption --bucket ${bucket} \
--server-side-encryption-configuration \
'{"Rules": [{"ApplyServerSideEncryptionByDefault": {"SSEAlgorithm": "AES256"}}]}' `

echo "Create DynamoDB Table:"
`aws dynamodb create-table \
  --table-name ${RG}-tfstate \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
  --region ${RG} ` 
