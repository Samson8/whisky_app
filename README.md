# Whisky App

This app is built with Flutter and implements the listed features, including using the BLoC pattern for state management. The goal is to demonstrate the flow of the app, with a focus on the "My Collection" and "Details" templates.

## Features

- **User Authentication**: Secure sign-in and sign-up process using email and password.
- **Whisky Collection**: Browse a collection of whiskies and view detailed information about each one.
- **Tasting Notes**: Add and manage tasting notes for each whisky (Nose, Palate, and Finish).
- **Offline Support**: Data is stored locally in the app, and will refresh after fetching when the internet connection is available.
- **State Management**: BLoC pattern used for managing the app's state.

## Design
- **Figma**: [Whisky_app_design](https://www.figma.com/file/gX69tW4YfXMvlGrYVu2l7Q/Untitled?node-id=0%3A1&t=F0MrdQ0b8gYMilE6-1)

## Tech Stack

- **Flutter**: Used for building the mobile application.
- **BLoC**: For state management using the BLoC pattern.
- **JSON Files**: Mockup data in JSON format instead of a REST API.
- **Git**: Version control system used for this project.

## Libraries Used

Here are the libraries and packages used in this project along with the reasons for their inclusion:

1. **google_fonts**  
   This package is used to easily integrate Google Fonts into the app. It helps to enhance the visual appearance and provide a wider range of font options for a better UI/UX.

2. **flutter_bloc**  
   This package is used for managing state in the app using the BLoC pattern. BLoC (Business Logic Component) helps separate business logic from UI, making the code more modular, testable, and maintainable.

3. **get_it**  
   `get_it` is a service locator for Dart and Flutter. It is used to manage app dependencies in a simple and easy-to-use manner, especially for dependency injection. It is used to access BLoC instances and other services in the app.

4. **localstore**  
   This package is used to store data locally in the app. In this project, it is used to save the whisky collection data and tasting notes. It provides a simple key-value storage solution that works well in Flutter.

5. **connectivity_plus**  
   `connectivity_plus` is used to check the network status (whether the app is online or offline). This package is essential for determining if the app should fetch new data from a remote source or work with locally stored data.

6. **flutter_svg**  
   This package is used for rendering SVG images in the app. It is used to display icons and illustrations in the app that are in SVG format, providing scalable and high-quality graphics.

## Installation

### Prerequisites

1. **Flutter**: Ensure Flutter is installed on your machine. You can find installation instructions on the [Flutter website](https://flutter.dev/docs/get-started/install).
   
2. **Packages**: The app uses a few packages from [pub.dev](https://pub.dev), which will be installed when running the app for the first time.

### Steps to Install

1. Clone the repository:
   ```bash
   git clone <repository_url>
   ```

2. Navigate to the project directory:
   ```bash
   cd whisky_app
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Usage

1. **Sign In**: The user can sign in using their email and password (john@mail.com, password123).
2. **Browse Whisky**: Users can browse the whisky collection and see detailed information.
3. **Add Tasting Notes**: Users can add tasting notes for each whisky (Nose, Palate, and Finish).
4. **Offline Support**: If no internet connection is available, the app will use the previously fetched data.

## Directory Structure

```bash
whisky_app/
│
├── lib/
│   ├── core/                # Core utilities and themes
│   ├── feature/             # Features like authentication, home screen, etc.
│   ├── main.dart            # App entry point
│
├── android/                 # Android-specific configurations
├── ios/                     # iOS-specific configurations
├── assets/                  # App assets like images, fonts, etc.
└── pubspec.yaml             # Project dependencies and settings
```

## Testing

To run the tests for the app, you can use the following command:

```bash
flutter test
```

## Screenshots

Here are some screenshots of the app:

<img src="https://github.com/user-attachments/assets/ff2c092c-be94-4125-b93e-d08b360d8c73" alt="Welcome Screen" width="300">
<img src="https://github.com/user-attachments/assets/25f4819d-614c-4529-80b6-0afce4e96d06" alt="Signing Screen" width="300">
<img src="https://github.com/user-attachments/assets/22c30952-2915-4458-9191-1dccc65f3dfa" alt="Notification" width="300">
<img src="https://github.com/user-attachments/assets/e8827bda-eefb-4420-8136-d265fcdd4fc8" alt="Details Page" width="300">
<img src="https://github.com/user-attachments/assets/97db99e8-7d77-4067-a3fb-467db5966f37" alt="Tasting Notes" width="300">
<img src="https://github.com/user-attachments/assets/9d7a4da7-bc09-4506-b0f1-4a509cbe3c1e" alt="History" width="300">



## Contributing

1. Fork the repository.
2. Create a new branch: `git checkout -b feature/your-feature-name`.
3. Commit your changes: `git commit -am 'Add new feature'`.
4. Push to the branch: `git push origin feature/your-feature-name`.
5. Create a new Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- **Flutter**: Thanks to the Flutter team for providing an amazing toolkit for cross-platform development.
- **BLoC**: For state management in Flutter.
