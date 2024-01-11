#!/bin/bash

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME=$GireeshStudy
TOKEN=$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

# User and Repository information
REPO_OWNER=$GireeshStudy
REPO_NAME=$learning

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${GireeshStudy}:${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}" "$url"
}

# Function to list users with read access to the repository
function list_users_with_read_access {
    local endpoint="repos/${GireeshStudy}/${learning}/collaborators"

    # Fetch the list of collaborators on the repository
    collaborators="$(github_api_get "$endpoint" | jq -r '.users[] | select(.permissions.pull == true) | .login')"

    # Display the list of collaborators with read access
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${GireeshStudy}/${learning}."
    else
        echo "Users with read access to ${GireeshStudy}/${learning}:"
        echo "$collaborators"
    fi
}

# Main script

echo "Listing users with read access to ${GireeshStudy}/${learning}..."
list_users_with_read_access
