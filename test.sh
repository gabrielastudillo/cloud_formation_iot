#!/bin/bash

# Update the instance
dnf update -y

# Install Apache
dnf install -y httpd

# Install PHP
dnf install -y php

# Install MariaDB
dnf install -y mariadb105-server

# Start and enable Apache
systemctl enable httpd
systemctl start httpd

# Start and enable MariaDB
systemctl enable mariadb
systemctl start mariadb

# Create a test web page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>LAMP Test</title>
</head>
<body>
    <h1>Hello from AWS EC2!</h1>
    <p>Your LAMP server is working.</p>
</body>
</html>
EOF
