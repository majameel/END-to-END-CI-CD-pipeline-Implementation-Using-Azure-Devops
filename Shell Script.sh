#!/bin/bash
set -x

# Define variables for container registry, image repository, and tag
containerRegistry="ciproject.azurecr.io" #give your project name 
imageRepository="ciprojectvotingapplication" # give your microservice name 
tag=$1  # This will be passed as an argument to the script

echo "Container Registry: ${containerRegistry}"
echo "Image Repository: ${imageRepository}"
echo "Tag: ${tag}"

# Define the repository URL
REPO_URL="https://<access-token>/<account-name>/<project-name>"

# Clone the git repository into the /tmp directory
rm -rf /tmp/temp_repo
git clone "$REPO_URL" /tmp/temp_repo || { echo "Failed to clone repository"; exit 1; }

# Navigate into the cloned repository directory
cd /tmp/temp_repo || { echo "Failed to change directory"; exit 1; }

# Fetch the latest changes and rebase
git fetch origin || { echo "Failed to fetch changes"; exit 1; }
git rebase origin/main || { echo "Failed to rebase"; exit 1; }

# Pull the latest changes from the remote repository
git pull origin main || { echo "Failed to pull latest changes"; exit 1; }

# Construct the file path for the deployment YAML
deployment_file="k8s-specifications/vote-deployment.yaml"

# Check if the deployment YAML file exists
if [ ! -f "$deployment_file" ]; then
    echo "Deployment YAML not found: ${deployment_file}"
    exit 1
fi

# Debug: Print out the deployment YAML before modification
echo "Current YAML contents:"
cat "$deployment_file"

# Make changes to the Kubernetes manifest file(s)
old_image=$(grep "image:" "$deployment_file")
new_image="image: ${containerRegistry}/${imageRepository}:${tag}"

echo "Old image: $old_image"
echo "New image: $new_image"

if [ "$old_image" != "$new_image" ]; then
    sed -i "s|image:.*|$new_image|g" "$deployment_file" || { echo "Failed to update manifest"; exit 1; }

    # Debug: Print out the deployment YAML after modification
    echo "Updated YAML contents:"
    cat "$deployment_file"

    # Check for changes
    git status

    # Add the modified files
    git add "$deployment_file"

    # Debug: Check git status after adding files
    git status

    # Commit the changes
    git commit -m "Update Kubernetes manifest to use image tag ${tag}" || { echo "Failed to commit changes"; exit 1; }

    # Push the changes back to the repository
    git push || { echo "Failed to push changes"; exit 1; }
else
    echo "No changes needed; the image is already up to date."
fi

# Cleanup: remove the temporary directory
rm -rf /tmp/temp_repo
