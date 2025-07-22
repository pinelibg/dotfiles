#!/bin/bash

# Setup global gitignore configuration
# This script runs once to configure git to use the global gitignore file

set -e

echo "Setting up global gitignore configuration..."

# Configure git to use the global gitignore file
git config --global core.excludesfile ~/.gitignore_global

echo "Global gitignore configuration set up successfully."
