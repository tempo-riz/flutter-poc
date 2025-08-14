#!/bin/bash

echo "Welcome to Flutter POC!"

# name
read -p "Enter the name of your Flutter app: " APP_NAME
if [[ ! "$APP_NAME" =~ ^[a-z_][a-z0-9_]*$ ]]; then
    echo "Invalid app name. Use only lowercase letters, numbers, and underscores."
    exit 1
fi

# org
read -p "Enter your organization (e.g., com.example) your full package name will be com.example.$APP_NAME: " ORG
if [[ ! "$ORG" =~ ^([a-z]+(\.[a-z0-9]+)+)$ ]]; then
    echo "Invalid organization. Use a domain-style name (e.g., com.example)"
    exit 1
fi

# platform
echo "Select platforms (space-separated):"
echo "1) Android"
echo "2) iOS"
echo "3) Web"
echo "4) macOS"
echo "5) Linux"
echo "6) Windows"
read -p "Enter your choices (e.g., 1 2 3): " PLATFORMS

PLATFORMS_LIST=()
for choice in $PLATFORMS; do
    case $choice in
    1) PLATFORMS_LIST+=("android") ;;
    2) PLATFORMS_LIST+=("ios") ;;
    3) PLATFORMS_LIST+=("web") ;;
    4) PLATFORMS_LIST+=("macos") ;;
    5) PLATFORMS_LIST+=("linux") ;;
    6) PLATFORMS_LIST+=("windows") ;;
    *) echo "Invalid choice: $choice" ;;
    esac
done

if [ ${#PLATFORMS_LIST[@]} -eq 0 ]; then
    echo "No valid platforms selected. Defaulting to all platforms."
    PLATFORM_ARGS="--platforms=android,ios,web,macos,linux,windows"
else
    PLATFORM_ARGS="--platforms=$(
        IFS=,
        echo "${PLATFORMS_LIST[*]}"
    )"
fi

# inplace
read -p "Create the Flutter app in the current directory? (y/n): " INPLACE

if [[ "$INPLACE" =~ ^[Yy]$ ]]; then
    flutter create --org "$ORG" $PLATFORM_ARGS --project-name "$APP_NAME" .
else
    flutter create --org "$ORG" $PLATFORM_ARGS --project-name "$APP_NAME" "$APP_NAME"
    cd "$APP_NAME" || exit
fi

if [ $? -ne 0 ]; then
    echo "Failed to create Flutter app."
    exit 1
fi

# Install dependencies
echo "Adding dependencies..."
flutter pub add \
  flutter_riverpod \
  riverpod_annotation \
  go_router \
  http \
  flutter_dotenv \
  loading_animation_widget \
  flutter_svg

flutter pub add --dev \
  build_runner \
  custom_lint \
  riverpod_lint \
  riverpod_generator \
  flutter_gen_runner

if [ $? -ne 0 ]; then
    echo "Failed to install dependencies."
    exit 1
fi

echo "Scaffolding Flutter app..."
# Replace lib folder with your POC lib
TMP_DIR=$(mktemp -d)
git clone --depth 1 https://github.com/tempo-riz/flutter-poc.git "$TMP_DIR"
POC_LIB_PATH="$TMP_DIR/poc/lib"

if [ -d "$POC_LIB_PATH" ]; then
    echo "Replacing lib folder with POC lib..."
    rm -rf lib
    cp -R "$POC_LIB_PATH" ./lib
else
    echo "POC lib folder not found in cloned repo."
    exit 1
fi

# Cleanup temp clone
rm -rf "$TMP_DIR"

# update imports paths
find lib -type f -name "*.dart" -exec sed -i '' "s/package:poc/package:$APP_NAME/g" {} +

# remove test folder since its not relevant yet
rm -rf test

# go to root if not in place
if [[ "$INPLACE" =~ ^[Yy]$ ]]; then
    cd ..
fi

read -p "Initialize Git repository? (y/n): " INIT_GIT
if [[ "$INIT_GIT" =~ ^[Yy]$ ]]; then
    git init
    git add .
    git commit -m "Initial commit"
    echo "Git repository initialized."
fi


echo "Flutter app '$APP_NAME' created successfully!"
