🚀 Ansible + Jenkins Integration Guide

✅ Step 1: Install Ansible on the Jenkins Server

Since Jenkins will execute Ansible playbooks, install Ansible on the Jenkins server or agent:

sudo apt update && sudo apt install -y ansible  # Ubuntu/Debian
sudo yum install -y ansible  # RHEL/CentOS

Verify the installation:

ansible --version

✅ Step 2: Install and Configure Jenkins

If Jenkins is not installed, install it:

# Ubuntu
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
echo "deb http://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt update && sudo apt install -y openjdk-11-jdk jenkins
sudo systemctl enable --now jenkins

Access Jenkins at: http://<your-server-ip>:8080

✅ Step 3: Install Required Jenkins Plugins

Go to Jenkins Dashboard → Manage Jenkins → Manage Plugins → Available

Search and install:

Ansible Plugin (optional, allows better integration)

Pipeline Plugin (for declarative pipelines)

SSH Pipeline Steps (to run Ansible on remote machines)

✅ Step 4: Configure Jenkins to Use Ansible

Go to Jenkins Dashboard → Manage Jenkins → Global Tool Configuration

Scroll down to Ansible and Add Ansible:

Name: ansible

Path to ansible executable: /usr/bin/ansible

Click Save

✅ Step 5: Configure SSH Access to Target Machines

Jenkins needs SSH access to run Ansible commands on remote hosts.

Generate an SSH key on the Jenkins server:

ssh-keygen -t rsa -b 4096

Copy the public key to the target machines:

ssh-copy-id user@remote-server

Verify SSH access:

ssh user@remote-server

✅ Step 6: Create an Ansible Playbook

Example: deploy.yml

---
- name: Deploy Application
  hosts: all
  become: yes
  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: present

    - name: Start Nginx
      service:
        name: nginx
        state: started

✅ Step 7: Create a Jenkins Pipeline Job

Go to Jenkins Dashboard → New Item → Pipeline

In Pipeline script, add the following:

pipeline {
    agent any
    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/your-repo.git'  // Replace with your repo
            }
        }
        stage('Run Ansible Playbook') {
            steps {
                ansiblePlaybook(
                    playbook: 'deploy.yml',
                    inventory: 'inventory.ini',
                    credentialsId: 'ssh-key-id'
                )
            }
        }
    }
}

✅ Step 8: Run the Job

Save the pipeline.

Click Build Now.

Check Console Output to see Ansible execution.

🎯 Final Thoughts

Jenkins manages the pipeline, and Ansible automates infrastructure changes.

For production, consider Ansible Vault for secret management.

Integrate with GitLab, Azure DevOps, or ArgoCD for GitOps workflows.

Would you like to extend this guide with GitLab CI/CD integration? 🚀