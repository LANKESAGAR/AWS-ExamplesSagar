## Create a website 1 
## Create a bucket
```sh
aws s3 mb s3://cors-fun-ab-sa-12
```
## Change block public access
```sh
aws s3api put-public-access-block \
    --bucket cors-fun-ab-sa-12 \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```
## Create a bucket policy
```sh
aws s3api put-bucket-policy --bucket cors-fun-ab-sa-12 --policy file://bucket-policy.json
```

## Turn on static website hosting
```sh
aws s3api put-bucket-website --bucket cors-fun-ab-sa-12 --website-configuration file://website.json
```

## Upload our index.html file and include a resource that would be cross-origin
```sh
aws s3 cp index.html s3://cors-fun-ab-sa-12
```

## View the website and see if index.html is there
http://cors-fun-ab-sa-12.s3-website-us-east-1.amazonaws.com

## Create a website 2

## Create a bucket
```sh
aws s3 mb s3://cors-fun2-ab-sa-12
```
## Change block public access
```sh
aws s3api put-public-access-block \
    --bucket cors-fun2-ab-sa-12 \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```
## Create a bucket policy
```sh
aws s3api put-bucket-policy --bucket cors-fun2-ab-sa-12 --policy file://bucket-policy2.json
```

## Turn on static website hosting
```sh
aws s3api put-bucket-website --bucket cors-fun2-ab-sa-12 --website-configuration file://website2.json
```

## Upload our index.html file and include a resource that would be cross-origin
```sh
aws s3 cp index2.html s3://cors-fun2-ab-sa-12
aws s3 cp hello.js s3://cors-fun2-ab-sa-12

```
## View the website and see if index.html is there
http://cors-fun2-ab-sa-12.s3-website-us-east-1.amazonaws.com/

## Create API Gateway with mock response an dthen test the endpoint
https://71yzjssc7j.execute-api.us-east-1.amazonaws.com/prod

curl -X POST "https://71yzjssc7j.execute-api.us-east-1.amazonaws.com/prod/hello" \
     -H "Content-Type: application/json" \
     -d '{"key1": "value1", "key2": "value2"}'

## Set CORS on our bucket
```sh
aws s3api put-bucket-cors --bucket cors-fun-ab-sa-12 --cors-configuration file://cors.json
```