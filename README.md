#Azure-Devops-End-to-End-CI/CD Implementation

About the Application :

Implementing Continuous Integration (CI)
A front-end web app in Python which lets you vote between two options
A Redis which collects new votes
A .NET worker which consumes votes and stores them
A Postgres database backed by a Docker volume
A Node.js web app which shows the results of the voting in real time
Azure DevOps - CI Setup

Cloning the Project Repo to Azure Devops
Creating an Azure Agent (VM) to run Jobs
Creating Pipelines for 2 stages -- Build and push
Trigger Pipeline if - there is any changes in Repo
Build image , Push image into Azure Container Registry (ACS)
Image

Azure DevOps - CD Setup

Implementing Continuous Deployment (CD)
Using AKS for CD
Creating AKS cluster on Azure
Configuring Virtual Machine Scale Sets as Node pools in AKS
Hands on sessions on AKS
End to End CI/CD Demonstration
Image
