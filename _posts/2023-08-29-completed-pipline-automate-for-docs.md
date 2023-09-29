# DevSecOps Project Setup Guide

## Introduction

In this comprehensive DevSecOps project setup guide, we'll ensure the security of your software development and deployment pipeline by integrating a wide range of tools and services. Here are the tools we'll be using:

- **Version Control:** Git/GitHub
- **Continuous Integration and Continuous Deployment (CI/CD):** Jenkins
- **Dynamic Application Security Testing:** OWASP ZAP
- **Kubernetes:** Container Orchestration
- **Code Quality and Static Analysis:** SonarQube
- **Continuous Delivery:** ArgoCD
- **Web Server:** Nginx
- **Container Registry:** Docker Hub
- **Container Security Scanning:** Clair
- **Secrets Management:** HashiCorp Vault
- **Cloud Infrastructure:** Oracle Cloud
- **Vulnerability Scanning:** OpenVAS
- **Web Application Firewall:** ModSecurity
- **Identity and Access Management:** Keycloak
- **Configuration Management:** Ansible

##  AWS and Oracle Cloud Server Deployment

 **AWS Deployment:**

   - Host your application on AWS using services like EC2 for virtual servers, S3 for storage, RDS for managed databases, or ECS for container orchestration. Choose the appropriate AWS services based on your project's requirements.
   - Follow the [AWS Documentation](https://docs.aws.amazon.com/index.html) for detailed instructions on deploying your application.

   [Installation Steps](install.md)

 **Oracle Cloud Deployment:**

   - If you choose Oracle Cloud as your hosting provider, Always Free Services: Oracle offered several "Always Free" services, which are available to use at no cost indefinitely. These services typically included compute, storage, and databases.
   - Refer to the [Oracle Cloud Documentation](https://docs.oracle.com/en/cloud/) for specific deployment guidelines tailored to Oracle Cloud.

Ensure that your deployment processes are automated and integrated into your CI/CD pipeline for consistent and reliable application deployment to both AWS and Oracle Cloud.

[Installation Steps](install.md)

## Step 1: Project Initialization

1. Create a new project repository on GitHub.

### Install Dependencies


Before you begin, ensure you have the following:

1. [Ruby](https://www.ruby-lang.org/en/documentation/installation/) (>= 2.4)
2. [RubyGems](https://rubygems.org/pages/download)
3. [Bundler](https://bundler.io/)


```shell
sudo apt update
sudo apt install ruby-full build-essential zlib1g-dev git
```
To avoid installing RubyGems packages as the root user:

If you are using ```bash``` (usually the default for most)

```shell
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

If you are using ```zsh``` (you know if you are)

```shell
echo '# Install Ruby Gems to ~/gems' >> ~/.zshrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.zshrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```
Install Jekyll ```bundler```

```shell
gem install jekyll bundler
```
# Chirpy Jekyll Theme - Quick Start Guide

Visit: https://github.com/cotes2020/jekyll-theme-chirpy#quick-start


## Installation

1. Clone the imaltaf repository:


```markdown
git clone https://github.com/imaltaf/Docs_web
```
then install your dependencies

```shell 
cd Docs_web bundle 
```
## Jekyll Commands

Testing Site 

```shell
bundle exec jekyll s
```
Creating a Post
Naming Conventions
Jekyll uses a naming convention for pages and posts

Create a file in _posts with the format

YEAR-MONTH-DAY-title.md
For example:

- 2022-05-23-homelab-docs.md
- 2022-05-34-hardware-specs.md

## Let's start Automate

## Step 2: Choose Your Tech Stack

2. Determine the technology stack for your project, including programming languages and frameworks, and document it in your project's README.md.

## Step 3: Set Up Continuous Integration (CI)

3.1. Install and configure Jenkins for CI/CD. You can follow the official documentation: [Jenkins Documentation](https://www.jenkins.io/doc/).

```bash
sudo apt update && apt upgrade
```
Install jenkins using ```Docker-compose```

```bash
mkdir jenkins
cd jenkins
```

```bash
sudo nano docker-compose.yml 
```
```bash
version: '3'
services:
  jenkins:
    image: jenkins/jenkins:latest
    container_name: jenkins
    restart: on-failure
    ports:
      - "8084:8080"
      - "50000:50000"
    volumes:
      - jenkins_home:/var/jenkins_home

volumes:
  jenkins_home:
```

And save file 

```bash
sudo docker-compose up -d
```
[ Full installation ]()


3.2. Create a Jenkins pipeline to automate the build, test, and deployment processes.

![Alt text](/img/image.png)

And press OK 

## Create Node for other server

![Alt text](/img/image-9.png)

![Alt text](/img/image-1.png)

![Alt text](/img/image-2.png)

![Alt text](/img/image-3.png)

fill all below 

![Alt text](/img/image-4.png)

# save

Create New item

![Alt text](/img/image-5.png)

Enter Project name and select pipline and click ```OK```

![Alt text](/img/image-6.png)

## Enter project name and Add pipline script which given below and press ```save```

![Alt text](/img/image-7.png)


Then go back and press ```Build Now```  and check the status

![Alt text](/img/image-8.png)

## Step 4: Code Quality and Static Analysis

4.1. Use Jenkins plugins or integrations to enforce coding standards and code quality checks.

4.2. Integrate SonarQube into your CI pipeline for advanced code analysis. Refer to the [SonarQube Documentation](https://docs.sonarqube.org/latest/) for setup instructions.


