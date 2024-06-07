# Simalungun Tourism


![Logo](assets/img/logo.png)


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Description

Simalungun Tourism is a Flutter application that showcases the beautiful tourist destinations in Simalungun, Indonesia. It provides users with information about various attractions, including historical sites, natural landscapes, cultural events, and more. With stunning visuals and detailed descriptions, Simalungun Tourism aims to inspire travelers to explore the hidden gems of Simalungun and experience its rich cultural heritage.

## Architecture

The Simalungun Tourism Flutter application follows the principles of Clean Architecture. Clean Architecture is a software design pattern that promotes separation of concerns and maintainability. It consists of three main layers: Presentation, Domain, and Data.

In the Presentation layer, we implement the user interface using Flutter widgets. This layer is responsible for handling user interactions and displaying data to the user. We use the BLoC (Business Logic Component) pattern for state management in the Presentation layer.

BLoC is a state management pattern that helps in separating the business logic from the UI. It stands for Business Logic Component and is based on the concept of streams and sinks. With BLoC, we can handle complex state management scenarios, such as handling user input, making API calls, and updating the UI accordingly.

In the Domain layer, we define the business logic and use cases of the application. This layer is independent of any framework or platform-specific code. It contains the core logic of the application, such as data validation, business rules, and algorithms.

The Data layer is responsible for interacting with external data sources, such as databases or APIs. It provides implementations of repositories and data sources that the Domain layer can use to fetch or persist data.

By following Clean Architecture and using BLoC for state management, the Simalungun Tourism application achieves a modular and maintainable codebase, with clear separation of concerns and easy testability.

## Dependencies

The Simalungun Tourism Flutter application utilizes the following libraries:

- `carousel_slider`: A package for creating image carousels in Flutter applications.
- `cupertino_icons`: A package that provides the Cupertino icons for Flutter applications.
- `dartz`: A functional programming library for Dart that provides useful abstractions and utilities.
- `equatable`: A package that makes it easy to implement value-based equality in Dart.
- `flutter_bloc`: A state management library that implements the BLoC pattern for handling complex state management scenarios.
- `flutter_rating_bar`: A package for creating rating bars in Flutter applications.
- `get_it`: A simple service locator for Dart and Flutter applications.
- `go_router`: A declarative router for Flutter applications.
- `google_fonts`: A package for using custom fonts in Flutter applications.
- `http`: A package for making HTTP requests and interacting with APIs.
- `image_picker`: A package for picking images from the device's gallery or camera.
- `intl`: A package for internationalizing Flutter applications.
- `shared_preferences`: A package for persisting key-value data on the device.
- `smooth_page_indicator`: A package for creating smooth page indicators in Flutter applications.
- `url_launcher`: A package for launching URLs in Flutter applications.

## Installation

To install and run the Simalungun Tourism Flutter application, follow these steps:

1. Make sure you have Flutter installed on your machine. If not, refer to the [Flutter installation guide](https://flutter.dev/docs/get-started/install) for instructions on how to set it up.

2. Clone the repository to your local machine by running the following command in your terminal or command prompt:

    ```
    git clone https://github.com/your-username/simalungun_tourism.git
    ```

    Replace `your-username` with your GitHub username.

3. Navigate to the project directory:

    ```
    cd simalungun_tourism
    ```

4. Install the project dependencies by running the following command:

    ```
    flutter pub get
    ```

5. Connect your device or start an emulator.

6. Run the application using the following command:

    ```
    flutter run
    ```

    This will build and launch the Simalungun Tourism application on your device or emulator.

That's it! You should now have the Simalungun Tourism Flutter application up and running on your device. Enjoy exploring the beautiful tourist destinations in Simalungun, Indonesia!



