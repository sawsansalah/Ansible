# Setup EC2 Collection and Authentication

## Install boto3

```
sudo apt install python3-boto3
```

## Install AWS Collection

```
ansible-galaxy collection install amazon.aws
```

## Setup Vault 

1. Create a password for vault

```
openssl rand -base64 2048 > vault.password
```

2. Add your AWS credentials using the below vault command

```
ansible-vault create group_vars/all/pass.yml --vault-password-file vault.password
```



3. To run Ansible-playbook with valut 

```
ansible-vault create group_vars/all/pass.yml --vault-password-file vault.password

```