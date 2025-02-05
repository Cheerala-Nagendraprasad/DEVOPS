
#!/bin/bash
# Update the instance
sudo apt-get update -y
sudo apt-get upgrade -y

# Add the Jenkins repository and key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Install Jenkins
sudo apt-get update -y
sudo apt-get install jenkins -y

# Install Java (Jenkins requires Java)
sudo apt install fontconfig openjdk-17-jre -y
java -version

# Enable and start Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Open the firewall for Jenkins (default port 8080)
sudo ufw allow 8080

# Print the Jenkins initial setup password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
