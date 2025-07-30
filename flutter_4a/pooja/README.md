# Flutter Navigation Example - Lab Session 4

## 👩‍💻 Developed by: Pooja

## 📱 Project Overview

This Flutter application demonstrates the implementation of basic navigation between different screens using Flutter's Navigator widget. This project was created as part of Lab Session 4, focusing on screen-to-screen navigation concepts in Flutter development.

## 🎯 Learning Objectives

- Understanding Flutter's navigation system
- Implementing Navigator.push() for forward navigation
- Implementing Navigator.pop() for backward navigation
- Creating multiple screens using StatelessWidget
- Working with MaterialPageRoute for screen transitions

## 🚀 Features

### Core Functionality
- **Two Screen Navigation**: Navigate between First Screen and Second Screen
- **Forward Navigation**: Use Navigator.push() to move to the next screen
- **Backward Navigation**: Use Navigator.pop() to return to the previous screen
- **Material Design**: Clean, modern UI following Material Design principles
- **AppBar Integration**: Each screen has its own AppBar with appropriate titles

### Navigation Flow
```
First Screen → [Button Press] → Second Screen
     ↑                              ↓
     └──────── [Back Button] ←──────┘
```

## 🏗️ Architecture

### Screen Structure
1. **MyApp**: Root application widget with MaterialApp configuration
2. **FirstScreen**: Entry point screen with navigation button
3. **SecondScreen**: Destination screen with back navigation button

### Navigation Implementation
- **Navigator.push()**: Creates a new route and pushes it onto the navigation stack
- **MaterialPageRoute**: Provides platform-appropriate transitions
- **Navigator.pop()**: Removes the current route from the navigation stack

## 📂 Project Structure

```
lib/
├── main.dart          # Main application file containing all screens
```

## 🔧 Key Components

### 1. MyApp (Root Widget)
- Configures the MaterialApp
- Sets the app title and theme
- Defines the home screen

### 2. FirstScreen
- Entry point of the application
- Contains an ElevatedButton for navigation
- Implements Navigator.push() to navigate to SecondScreen

### 3. SecondScreen
- Destination screen
- Contains an ElevatedButton for back navigation
- Implements Navigator.pop() to return to FirstScreen

## 💻 Code Highlights

### Navigation to Second Screen
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondScreen()),
);
```

### Navigation Back to First Screen
```dart
Navigator.pop(context);
```

## 🎨 UI/UX Features

- **Consistent Design**: Both screens follow the same design pattern
- **Clear Actions**: Descriptive button labels for easy understanding
- **Material Design**: Uses Material Design components for native feel
- **Blue Theme**: Professional blue color scheme throughout the app

## 🔄 Navigation Flow Diagram

```
┌─────────────────┐    Navigator.push()    ┌─────────────────┐
│   First Screen  │ ─────────────────────→ │  Second Screen  │
│                 │                        │                 │
│ [Go to Second   │                        │ [Go back to     │
│  Screen]        │ ←───────────────────── │  First Screen]  │
└─────────────────┘    Navigator.pop()     └─────────────────┘
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK installed
- Dart SDK installed
- An IDE (VS Code, Android Studio, or IntelliJ IDEA)
- Android/iOS emulator or physical device

### Installation & Running

1. **Clone or download the project**
   ```bash
   cd flutter_4a
   ```

2. **Get dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

### Testing the Navigation

1. Launch the app - you'll see the "First Screen"
2. Tap "Go to Second Screen" button
3. Observe the smooth transition to the "Second Screen"
4. Tap "Go back to First Screen" button
5. Observe the return to the "First Screen"

## 📚 Learning Outcomes

After completing this lab session, you will understand:

- **Navigation Stack**: How Flutter manages the navigation stack
- **Route Management**: Creating and managing routes between screens
- **Context Usage**: How context is used in navigation
- **MaterialPageRoute**: Platform-specific page transitions
- **State Management**: How screen state is maintained during navigation

## 🔍 Key Concepts Demonstrated

### 1. Navigation Stack
The app demonstrates how Flutter maintains a stack of routes, where:
- `push()` adds a new route to the top of the stack
- `pop()` removes the current route from the stack

### 2. Route Building
Shows how to create routes dynamically using MaterialPageRoute builder pattern.

### 3. Context Passing
Demonstrates proper context usage for navigation operations.

## 🌟 Potential Enhancements

This basic navigation example can be extended with:

- **Named Routes**: Using route names instead of direct widget references
- **Route Arguments**: Passing data between screens
- **Custom Transitions**: Creating custom page transition animations
- **Navigation Guards**: Adding authentication or validation checks
- **Bottom Navigation**: Implementing tab-based navigation
- **Drawer Navigation**: Adding slide-out navigation menu

## 📝 Notes for Pooja

This implementation covers the fundamental navigation concepts in Flutter. The code is clean, well-structured, and follows Flutter best practices. You can use this as a foundation for more complex navigation scenarios in future projects.

## 🐛 Troubleshooting

### Common Issues:
1. **Build Errors**: Ensure Flutter SDK is properly installed
2. **Navigation Issues**: Check context usage in Navigator calls
3. **UI Problems**: Verify Material Design widgets are properly imported

### Debug Tips:
- Use `flutter doctor` to check your development environment
- Check the debug console for any error messages
- Ensure proper widget tree structure

## 📖 Further Reading

- [Flutter Navigation Documentation](https://docs.flutter.dev/development/ui/navigation)
- [MaterialPageRoute Class](https://api.flutter.dev/flutter/material/MaterialPageRoute-class.html)
- [Navigator Class](https://api.flutter.dev/flutter/widgets/Navigator-class.html)

---

**Happy Coding! 🚀**

*Project completed as part of Flutter Development Lab Session 4*
