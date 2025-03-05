# Flutter POC

## Table of Contents
- [Flutter POC](#flutter-poc)
  - [Table of Contents](#table-of-contents)
  - [1. Introduction](#1-introduction)
  - [2. Project Setup](#2-project-setup)
    - [2.1 Create a New Flutter Project](#21-create-a-new-flutter-project)
  - [3. Features](#3-features)
    - [3.1 Default Choices for a Quick Start](#31-default-choices-for-a-quick-start)
  - [4. Dependencies](#4-dependencies)
    - [4.1 Feedback \& Updates](#41-feedback--updates)
    - [4.2 Navigation](#42-navigation)
    - [4.3 State Management](#43-state-management)
    - [4.4 Network \& External Access](#44-network--external-access)
    - [4.5 Localization](#45-localization)
    - [4.6 Local Storage](#46-local-storage)
    - [4.7 Common Tools](#47-common-tools)
  - [5. Development Dependencies](#5-development-dependencies)
    - [5.1 Testing](#51-testing)
    - [5.2 Linting](#52-linting)
    - [5.3 Generators](#53-generators)
    - [5.4 Icons \& Splash Screens](#54-icons--splash-screens)
  - [6. Development Environment](#6-development-environment)
    - [6.1 Recommended VSCode Extensions](#61-recommended-vscode-extensions)
  - [7. Deployment](#7-deployment)
    - [7.1 Fastlane](#71-fastlane)

## 1. Introduction
This project provides a quick and efficient setup for a **Flutter Proof of Concept (PoC)** with essential features, including navigation, state management, localization, Firebase, and GitHub feedback integration.

## 2. Project Setup

### 2.1 Create a New Flutter Project
Run the following command to create a new Flutter project:

```bash
./create.sh
```

You will be prompted to enter:
- **App name** (e.g., `myapp`)
- **Organization name** (e.g., `com.example`)
- **Supported platforms** (iOS, Android, Web, macOS, Windows, Linux)
- **Whether to create the app in the current folder**
- **Whether to initialize Git**

## 3. Features

### 3.1 Default Choices for a Quick Start
This setup includes recommended configurations to streamline the development process:
- **Navigation**: `go_router`
- **State Management**: `riverpod`
- **Code Generation**: `build_runner` for Riverpod, Hive, assets, and localization
- **Localization**: Multi-language support
- **Firebase & GitHub Feedback**: Quick iteration and feedback collection

## 4. Dependencies

### 4.1 Feedback & Updates
- `firebase_core`
- `firebase_analytics`
- `firebase_crashlytics`
- `feedback_github`
- `in_app_review`
- `upgrader`

### 4.2 Navigation
- `go_router`

### 4.3 State Management
- `riverpod`
- `flutter_riverpod`
- `flutter_hooks`
- `hooks_riverpod`
- `riverpod_annotation`

### 4.4 Network & External Access
- `http`
- `dio`
- `url_launcher`
- `share_plus`
- `connectivity_plus`

### 4.5 Localization
- `intl`
- `flutter_localizations`

### 4.6 Local Storage
- `hive`
- `hive_flutter`

### 4.7 Common Tools
- `flutter_dotenv`
- `loading_animation_widget`
- `flutter_svg`
- `mime`
- `device_info_plus`
- `package_info_plus`
- `uuid`

## 5. Development Dependencies

### 5.1 Testing
- `flutter_test`
- `mockito`

### 5.2 Linting
- `riverpod_lint`
- `custom_lint`
- `flutter_lints`

### 5.3 Generators
- `build_runner`
- `hive_generator`
- `flutter_gen_runner`

### 5.4 Icons & Splash Screens
- `flutter_launcher_icons`
- `flutter_native_splash`

## 6. Development Environment

### 6.1 Recommended VSCode Extensions
- **Dart**
- **Flutter**
- **Flutter Extract to ARB**

## 7. Deployment

### 7.1 Fastlane
- `fastlane` is used for deployment automation.

