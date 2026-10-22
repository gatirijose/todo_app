# Todo App

A Flutter to-do application with a modern Material 3 interface, custom theme settings, and local persistence for tasks.

## Overview

This app lets users:

- Add new tasks
- Edit existing task titles
- Mark tasks as complete or incomplete
- View tasks in a mobile-friendly home screen
- Customize the app theme and typography
- Keep task data saved locally between sessions

## Features

- Material 3 design system
- Light/dark mode support
- Material You dynamic color theme support
- Custom accent color selection
- Adjustable typography/font settings
- Local persistence using Hive and SharedPreferences
- State management with Riverpod

## Tech Stack

- Flutter
- Dart
- Riverpod
- Hive
- SharedPreferences
- Material UI package
- Google Fonts
- Dynamic Color

## Project Structure

```text
.
├── lib/
│   ├── main.dart
│   ├── core/
│   │   ├── app_storage.dart
│   │   ├── models/
│   │   │   └── todo.dart
│   │   └── providers/
│   │       ├── font_settings_provider.dart
│   │       ├── seed_color_provider.dart
│   │       ├── theme_provider.dart
│   │       ├── todos_provider.dart
│   │       └── use_dynamic_provider.dart
│   └── views/
│       ├── home_screen.dart
│       ├── home_page/
│       │   ├── edit_todo_sheet.dart
│       │   └── home_page.dart
│       └── settings_page/
│           ├── settings_page.dart
│           └── widgets/
├── pubspec.yaml
├── analysis_options.yaml
├── android/
├── ios/
├── macos/
├── linux/
├── windows/
├── web/
└── test/
```

## Getting Started

### Prerequisites

- Flutter SDK installed and configured on your machine
- A supported emulator or physical device

### Install dependencies

```bash
flutter pub get
```

### Run the app

```bash
flutter run
```

## App Behavior

The app initializes its local storage on startup and loads saved tasks from Hive. Theme preferences and user settings are stored in SharedPreferences so the selected appearance persists across app launches.

## Notes

This project is a custom Flutter todo app built as a learning and UI experimentation project, with emphasis on modern app styling and personalization rather than a large multi-screen production architecture.

## License

This project is provided as-is for personal and educational use.
