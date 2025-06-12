# EC2_MC_Server
Ansible and terraform scripts to install minecraft on a server
# Minecraft Server Infrastructure Automation

## Background

This project automates the provisioning and configuration of a Minecraft server on AWS using Infrastructure as Code (IaC) principles. We'll use Terraform to provision the necessary AWS resources (EC2 instance, networking components) and Ansible to configure the Minecraft server software.

The solution ensures the Minecraft server starts automatically on system boot and shuts down properly when the instance is terminated.

## Requirements

1. **AWS Account**
2. **Installed Tools**:
   - Terraform (v1.0+)
   - Ansible (v2.10+)
   - Git
3. **Credentials**:
    - AWS credentials saved in a text file named credentials.txt
    - The location in terrafroms main.tf file needs to be changed to match your location
    - AWS Key needs to be named minecraft


![**Pipe Line Diagram**](https://github.com/cdttn99/EC2_MC_Server/blob/main/Minecraft%20server%20aws.png)

## Commands
1. **GIT**
```bash
    - Git clone https://github.com/cdttn99/EC2_MC_Server.git
``` 
- This will clone the directory with all the scripts in it 

2. **Terraform**:
    - cd into the terraform directory
```bash
Terraform apply
    yes   
```

- This command will build your EC2 instance.
3. **Ansible**
    - cd out of the terraform directory and into Ansible directory
    - Change the IP in inventory.ini to the ip of your new EC2 instance it should be in the output of your terraform script
    - Then run the command
```bash
ansible-playbook -i inventory.ini Minecraft_setup.yml
```
- This command will run through the script updating the ec2 instance, install minecraft prerequisites and running the minecraft server
-  Now open your minecraft client put in the IP from the terraform output and youre connected!
