# End-to-End CI/CD Pipeline Implementation Using Azure DevOps

![Azure DevOps CI/CD](https://github.com/user-attachments/assets/4ac0e989-bd84-4e10-b4fa-46bec08ec68e)

## About the Application

This project demonstrates the implementation of a complete CI/CD pipeline for a microservices-based application. The application consists of:

- **Front-End Web App**: A Python-based app that allows users to vote between two options.
- **Redis**: A service that collects new votes.
- **.NET Worker**: Consumes votes from Redis and stores them.
- **Postgres Database**: Stores the vote data, backed by a Docker volume.
- **Node.js Web App**: Displays real-time voting results.

![Application Overview](https://github.com/user-attachments/assets/2d8389f1-df83-4bf6-be3e-ec1ae314d685)

## Continuous Integration (CI)

1. **Developer Makes Changes**: Code changes are committed to the GitHub repository.
2. **Trigger**: The CI pipeline is automatically triggered on code push.
3. **Build the Image**: The pipeline builds Docker images for each microservice.
4. **Push the Image**: The images are pushed to Azure Container Registry (ACR).
5. **Update the Image ID**: The image ID in the deployment YAML file is updated.

## Shell Script for Updating Image ID

### Purpose:
The shell script updates the image tag in the deployment YAML file with the latest image ID from the ACR. It is executed as part of the CI pipeline to ensure the latest version is deployed.

## Continuous Deployment (CD)

1. **GitOps (ArgoCD)**: ArgoCD monitors the deployment YAML file and Azure Repo for changes.
2. **Deploy to AKS**: ArgoCD deploys the updated image to the Azure Kubernetes Service (AKS) cluster.

## Additional Components

1. **Containerization**: Microservices are containerized using Dockerfiles.
2. **Azure DevOps**: CI/CD pipeline configuration and management.
3. **Azure Container Registry (ACR)**: Stores Docker images.
4. **Azure Kubernetes Service (AKS)**: Hosts the deployed application.
5. **Azure Agent**: A virtual machine that acts as an Azure agent for running pipeline stages.

## Pipeline Stages

![Pipeline Stages](https://github.com/user-attachments/assets/a4df0075-6016-4d9b-902c-3a801b621b0d)
