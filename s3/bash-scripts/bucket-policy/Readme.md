## Create a bucket

aws s3 mb s3://bucket-policy-example-sa-12

## Create a bucket policy

aws s3api put-bucket-policy --bucket bucket-policy-example-sa-12 --policy file://policy.json

## In the other account access the bucket

touch bootcamp.txt
aws s3 cp bootcamp.txt s3://bucket-policy-example-sa-12
aws s3 ls s3://bucket-policy-example-sa-12



## Cleanup

aws s3 rm s3://bucket-policy-example-sa-12/bootcamp.txt
aws s3 rb s3://bucket-policy-example-sa-12
