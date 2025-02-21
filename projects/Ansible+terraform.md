 Ansible + TeeraformIntegration Guide

## ✅ Step 1: Install AWS cli


```sh
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip
unzip awscliv2.zip
sudo ./aws/insta
```

# Configure AWS CLI

```sh
aws configure
```
When configuring AWS CLI, you will be prompted for your AWS Access Key, Secret Key, Region, and
Output format
## ✅ Step 2:  Install Terraform

Terraform is an open-source infrastructure as code (IaC) tool used to provision and manage cloud
resources, such as AWS EC2 instances.
```sh
# Install required dependencies
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
# Add HashiCorp's GPG key and repository
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee
/usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee
/etc/apt/sources.list.d/hashicorp.list
# Update the package list and install Terraform
sudo apt update
sudo apt-get install terraform -y
Verify the installation by running:
terraform --version
```