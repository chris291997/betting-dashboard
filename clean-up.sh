#!/bin/bash

# Navigate to the build/web directory
cd build/web

# Find and remove executable files
find . -type f -name "*.exe" -exec rm -f {} \;
find . -type f -name "*.sh" -exec rm -f {} \;
find . -type f -name "*.bat" -exec rm -f {} \;

# Navigate back to the project root
cd ../..

# Deploy to Firebase Hosting
firebase deploy --only hosting