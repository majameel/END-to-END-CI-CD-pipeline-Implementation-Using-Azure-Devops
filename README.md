![Azure Devops Cicd](https://github.com/user-attachments/assets/4ac0e989-bd84-4e10-b4fa-46bec08ec68e)


About the Application :

Implementing Continuous Integration (CI)
A front-end web app in Python which lets you vote between two options
A Redis which collects new votes
A .NET worker which consumes votes and stores them
A Postgres database backed by a Docker volume
A Node.js web app which shows the results of the voting in real time

![image](https://github.com/user-attachments/assets/2d8389f1-df83-4bf6-be3e-ec1ae314d685)


<h1>Continuous Integration (CI)</h1>
1.Developer makes changes: The development team makes code changes and commits them to the GitHub repository.
2.Trigger: The CI pipeline is triggered automatically when changes are pushed to the repository.
3.Build the image: The pipeline builds the Docker image for the microservice using the Dockerfile.
4.Push the image: The built Docker image is pushed to the Azure Container Registry (ACR).
5.Update the image ID: The pipeline updates the image ID in the service deployment YAML file.

<h1>Shell Script for Updating Image ID</h1>
Understanding the Purpose:
The shell script's primary function is to update the image tag in the deployment YAML file with the latest image ID from the Azure Container Registry (ACR).
This script is typically executed as part of the CI pipeline.

<h1>Continuous Deployment (CD)</h1>
1.GitOps (ArgoCD): ArgoCD monitors the changes in the service deployment YAML file also monitors the changes in azure Repo.
2.Deploy to AKS: ArgoCD picks up the latest image ID and deploys the updated image to the AKS cluster.

<h1>Additional Components</h1>
1.Containerization: Microservices are containerized using Dockerfiles.
2.Azure DevOps: The CI/CD pipeline is configured and managed in Azure DevOps.
3.Azure Container Service: The built Docker images are stored in the Azure Container Registry.
4.Azure Kubernetes Service: The application is deployed to an AKS cluster.
5.Azure Agent: A virtual machine acts as an Azure agent for running pipeline stages.


<h1> Pipeline Stages </h1>

![image](https://github.com/user-attachments/assets/a4df0075-6016-4d9b-902c-3a801b621b0d)
