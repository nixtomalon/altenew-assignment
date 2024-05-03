# altenew_assignment

Altenew Assignment

## Shopify API Example Flutter App

This Flutter app demonstrates how to integrate with the Shopify API to fetch a list of products for a collection and display the product details.

## Feature
- **Product List**: Fetches a list of products from Shopify and displays them in a scrollable list. Each product item in the list is tappable to navigate to the product detail screen.
- **Product Detail**: Displays detailed information about a selected product including its title, price, description, and provides an option to add the product to the cart.

## Technologies Used
- **Flutter**: Flutter is Google's UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase
- **Shopify API**: The Shopify API is used to fetch product data from a Shopify store. This app demonstrates how to authenticate with the Shopify API and make requests to retrieve product information.

## Screenshot
| Product List | Product Detail |
|--------------|----------------|
| <img src="https://github.com/nixtomalon/Recipe-Finder/blob/master/assets/product_list.png" width="185"/> | <img src="https://github.com/nixtomalon/Recipe-Finder/blob/master/assets/product_detail.png" width="185"/> |


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