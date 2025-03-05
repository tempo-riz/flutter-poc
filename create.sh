#!/bin/bash

echo "Welcome to Flutter POC!"

# Prompt for app name
read -p "Enter the name of your Flutter app: " APP_NAME

# Validate app name
if [[ ! "$APP_NAME" =~ ^[a-z_][a-z0-9_]*$ ]]; then
    echo "Invalid app name. Use only lowercase letters, numbers, and underscores."
    exit 1
fi

# Prompt for organization
read -p "Enter your organization (e.g., com.example): " ORG

# Validate organization
if [[ ! "$ORG" =~ ^[a-z.][a-z0-9.]*$ ]]; then
    echo "Invalid organization. Use only lowercase letters, numbers, and periods."
    exit 1
fi

# Prompt for platforms
echo "Select platforms (space-separated):"
echo "1) Android"
echo "2) iOS"
echo "3) Web"
echo "4) macOS"
echo "5) Linux"
echo "6) Windows"
read -p "Enter your choices (e.g., 1 2 3): " PLATFORMS

# Convert choices to Flutter CLI format
PLATFORM_ARGS=""
for choice in $PLATFORMS; do
    case $choice in
    1) PLATFORM_ARGS+=" --platforms=android" ;;
    2) PLATFORM_ARGS+=" --platforms=ios" ;;
    3) PLATFORM_ARGS+=" --platforms=web" ;;
    4) PLATFORM_ARGS+=" --platforms=macos" ;;
    5) PLATFORM_ARGS+=" --platforms=linux" ;;
    6) PLATFORM_ARGS+=" --platforms=windows" ;;
    *) echo "Invalid choice: $choice" ;;
    esac
done

# Ask if user wants to create the project in the current directory
read -p "Create the Flutter app in the current directory or in a new one ? (y/n): " INPLACE

if [[ "$INPLACE" =~ ^[Yy]$ ]]; then
    echo "$ORG" $PLATFORM_ARGS
    flutter create --org "$ORG" $PLATFORM_ARGS --project-name "$APP_NAME" .
else
    flutter create --org "$ORG" $PLATFORM_ARGS "$APP_NAME"
    cd "$APP_NAME" || exit
fi

if [ $? -ne 0 ]; then
    echo "Failed to create Flutter app."
    exit 1
fi

# Initialize Git repo
read -p "Initialize Git repository? (y/n): " INIT_GIT
if [[ "$INIT_GIT" =~ ^[Yy]$ ]]; then
    git init
    git add .
    git commit -m "Initial commit"
    echo "Git repository initialized."
fi

echo "Flutter app '$APP_NAME' created successfully!"
