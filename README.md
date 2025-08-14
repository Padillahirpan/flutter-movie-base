# CinemaTix

CinemaTix is a Flutter-based mobile app for booking movie tickets. Users can top up their balance, view booked movies, login, register, and browse movies by categories such as "Now Playing" and "Upcoming".
Using sepearation of cencerns and clean architecture method

## Features

- **Book Movie Tickets:** Browse movies and book tickets directly from the app.
- **Balance Top-Up:** Easily top up your account balance for ticket purchases.
- **User Authentication:** Login and register with secure authentication.
- **View Booked Movies:** See a list of movies you have booked.
- **Movie Categories:** Explore "Now Playing", "Upcoming", and more.

## Project Structure & Separation of Concerns

The project follows a layered architecture for better maintainability and scalability:

- **data** (Resource Access Layer)
  - `api`: API service and network calls
  - `dummies`: Dummy/mock data for testing and development
  - `firebase`: Firebase integration (auth, firestore, storage)
  - `repository`: Data repositories for abstraction
  - `tmdb`: TMDB API integration

- **domain** (Business Logic Layer)
  - `entities`: Core business models and entities
  - `usecases`: Application use cases and business rules

- **presentation** (UI Layer)
  - `extensions`: Dart/Flutter extensions for UI and logic
  - `misc`: Miscellaneous helpers and utilities
  - `pages`: App screens and pages
  - `providers`: State management providers (Riverpod)
  - `widgets`: Reusable UI components

## Tech Stack

This project uses the following main technologies and packages:

- **Flutter** (SDK: ^3.8.1)
- **State Management:** [Riverpod](https://riverpod.dev/) (`flutter_riverpod`, `riverpod_annotation`, `riverpod_generator`)
- **Firebase:** `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_storage`
- **Networking:** [Dio](https://pub.dev/packages/dio)
- **Environment Variables:** [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
- **UI:** [Google Fonts](https://pub.dev/packages/google_fonts), [Cupertino Icons](https://pub.dev/packages/cupertino_icons), [cached_network_image](https://pub.dev/packages/cached_network_image), [image_picker](https://pub.dev/packages/image_picker), [transparent_image](https://pub.dev/packages/transparent_image)
- **Routing:** [go_router](https://pub.dev/packages/go_router)
- **Utilities:** [intl](https://pub.dev/packages/intl), [path](https://pub.dev/packages/path), [shared_preferences](https://pub.dev/packages/shared_preferences)
- **Code Generation:** [Freezed](https://pub.dev/packages/freezed), [json_serializable](https://pub.dev/packages/json_serializable), [freezed_annotation](https://pub.dev/packages/freezed_annotation), [json_annotation](https://pub.dev/packages/json_annotation)
- **Linting & Testing:** [flutter_lints](https://pub.dev/packages/flutter_lints), [custom_lint](https://pub.dev/packages/custom_lint), [flutter_test](https://docs.flutter.dev/cookbook/testing/unit/introduction)

## Getting Started

This project is a starting point for a Flutter application.
- Add [Flutter](https://flutter.dev/docs/get-started/install) to your machine
- Open this project folder with Terminal/CMD and run `flutter pub get`
- Run `flutter run` to build and run the debug app on your emulator/phone

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
