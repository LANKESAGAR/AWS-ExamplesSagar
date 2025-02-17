# Define variables
$downloadUrl = "https://www.apachelounge.com/download/VS17/binaries/httpd-2.4.58-240131-win64-VS17.zip"
$zipPath = "C:\apache.zip"
$extractPath = "C:\Apache24"

# Download Apache ZIP file
Write-Output "Downloading Apache..."
$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile($downloadUrl, $zipPath)

# Extract Apache files
Write-Output "Extracting Apache..."
Expand-Archive -Path $zipPath -DestinationPath "C:\" -Force
Rename-Item -Path "C:\httpd-2.4.58-240131-win64-VS17" -NewName "Apache24" -Force

# Remove ZIP file after extraction
Remove-Item -Path $zipPath -Force

# Define Apache executable path
$httpdPath = "C:\Apache24\bin\httpd.exe"

# Install Apache as a Windows service
Write-Output "Installing Apache as a service..."
Start-Process -FilePath $httpdPath -ArgumentList "-k install" -Wait

# Start Apache service
Write-Output "Starting Apache service..."
Start-Service -Name "Apache2.4"

Write-Output "Apache has been installed and started successfully!"
