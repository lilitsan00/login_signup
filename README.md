# Flutter Login/Signup App

## Features
- User registration with email, username, and password
- Secure login authentication
- Persistent user session with `SharedPreferences`
- Animated form transitions between login and signup
- `MobX` state management for reactive UI updates

## Technologies Used
- Flutter
- MobX
- SharedPreferences
- SQLite (`sqflite`)
- Provider for dependency injection


## Project Structure

```
├─ assets
│  ├─ fonts
│  │  ├─ TTNormsPro-Bold.ttf
│  │  └─ TTNormsPro-Regular.ttf
│  └─ icons
│     ├─ background.svg
│     └─ logo.svg
│
├─ lib
│  ├─ constants
│  │  ├─ app_theme.dart
│  │  ├─ colors.dart
│  │  └─ constants.dart
│  ├─ database_helper
│  │  └─ database_selper.dart
│  ├─ extension
│  │  └─ string_extension.dart
│  ├─ main.dart
│  └─ screens
│     ├─ authentication
│     │  ├─ auth_screen.dart
│     │  ├─ auth_store.dart
│     │  └─ auth_store.g.dart
│     ├─ home
│     │  └─ home_screen.dart
│     └─ login_signup
│        ├─ login_signup_screen.dart
│        ├─ _signup_fields.dart
│        └─ _widgets.dart
├─ pubspec.lock
├─ pubspec.yaml
├─ README.md
├─ test
│  └─ auth_store_test.dart

```