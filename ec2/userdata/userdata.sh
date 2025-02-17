#!/bin/bash

# Update system package repository
sudo yum update -y

# Install Apache (httpd)
sudo yum install -y httpd

# Start Apache service
sudo systemctl start httpd

# Enable Apache to start at boot
sudo systemctl enable httpd

# Create a custom HTML file
cat <<EOF | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to My Website</title>
</head>
<body>
    <h1>Hello, this is a custom HTML page served from my Apache server on EC2.</h1>
    <p>This is a test page deployed using an automated script.</p>
</body>
</html>
EOF

# Restart Apache to apply changes
sudo systemctl restart httpd

echo "Apache has been installed and is serving a custom webpage!"
