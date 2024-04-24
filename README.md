# altenew_assignment

Altenew Assignment

## Description

A Flutter sample app for Altenew

### State Management

This app uses ``Business Logic Components (BLoC)`` pattern for managing state and business logic in the app

### Remote Integration

For remote integration it uses ``GraphQL Integration`` and ``Dio Package`` Efficient and flexible data retrieval with GraphQL and Http from a remote server

### Architecture Overview

This project is structured based on Clean Architecture guidelines. Here's a brief overview:

``Domain Layer``: Contains business logic and entities.
``Data Layer``: Includes data models, data sources, and repository implementations.
``Presentation Layer``: Composed of screens and widgets, managed by BLoC components.

### Prerequisites

- Flutter (Version: 3.19.2) Stable channel
- Dart (Version: 3.3.0)
- An IDE (e.g., VSCode, Android Studio, IntelliJ)

## Installation
To run the app:
```shell
git clone https://github.com/nixtomalon/altenew-assignment.git
flutter clean
flutter pub get
dart run build_runner build
flutter run
```