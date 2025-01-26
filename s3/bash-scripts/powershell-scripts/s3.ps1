# Import the AWS Tools for PowerShell module
Try {
    Import-Module AWS.Tools.S3 -ErrorAction Stop
} Catch {
    Write-Error "Failed to load AWS.Tools.S3 module. Ensure it is installed by running 'Install-AWSToolsModule AWS.Tools.S3'."
    Exit 1
}

# Region and bucket name input
$region = "us-east-1"
$bucketName = Read-Host -Prompt 'Enter the S3 bucket name'

Write-Host "AWS Region: $region"
Write-Host "S3 Bucket: $bucketName"

# Check if the S3 bucket exists and create it if not
Try {
    function BucketExists {
        $bucket = Get-S3Bucket -BucketName $bucketName -ErrorAction SilentlyContinue
        return $bucket -ne $null
    }

    if (-not (BucketExists)) {
        Write-Host "S3 Bucket does not exist. Creating the bucket..."
        New-S3Bucket -BucketName $bucketName -Region $region
    } else {
        Write-Host "Bucket already exists."
    }
} Catch {
    Write-Error "Failed to create or check S3 bucket. Error: $_"
    Exit 1
}

# Create a new file
$fileName = 'myfile.txt'
$fileContent = 'Hello World!'
$filePath = Join-Path -Path (Get-Location) -ChildPath $fileName

Set-Content -Path $filePath -Value $fileContent

# Upload the file to the S3 bucket
Try {
    Write-S3Object -BucketName $bucketName -File $filePath -Key $fileName
    Write-Host "File '$fileName' successfully uploaded to bucket '$bucketName'."
} Catch {
    Write-Error "Failed to upload file to S3. Error: $_"
}
