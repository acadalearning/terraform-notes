#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
sudo echo "<h5>ACADA Learning</h5>" | sudo tee /var/www/html/index.html


#! /bin/bash
# Instance Identity Metadata Reference - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-#identity-documents.html
#sudo yum update -y
#sudo yum install -y httpd
#sudo systemctl enable httpd
#sudo service httpd start
#sudo echo '<h1>ACADA Learning</h1>' | sudo tee /var/www/html/index.html
#sudo mkdir /var/www/html/app1
#sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>ACADA #Learning</h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee #/var/www/html/app1/index.html
#sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o #/var/www/html/app1/metadata.html


# Ensure that you update the inbound rules on the security group of your instance. Add http port 80
