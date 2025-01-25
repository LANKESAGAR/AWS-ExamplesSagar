# AWS-ExamplesSagar
A Codebase of all the AWS examples used through AWS Certification Study Courses
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update

CREATE BUCKET
./s3/bash-scripts/create-bucket my-new-bucket-sa
DELETE BUCKET
./s3/bash-scripts/delete-bucket my-new-bucket-sa

To give execute permissions
ls -la s3
ls -la s3/bash-scripts/
chmod u+x s3/bash-scripts/*

To work on different s3 things
./s3/bash-scripts/create-bucket
./s3/bash-scripts/delete-bucket
./s3/bash-scripts/sync my-new-bucket-sa myfile
./s3/bash-scripts/put-object
./s3/bash-scripts/put-object my-new-bucket-sa /tmp/newfile.txt
./s3/bash-scripts/list-objects
./s3/bash-scripts/list-buckets
./s3/bash-scripts/get-newest-buckets