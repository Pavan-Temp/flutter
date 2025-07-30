# Flutter Lab Session 6: Custom Widgets

**Developed by:** Pooja  
**Experiment:** Lab Session 6a - Creating Custom Widgets for Specific UI Elements  

## 🎯 Project Overview

This Flutter application demonstrates the creation and implementation of **custom widgets** for building reusable UI components. The project showcases how to create modular, maintainable, and reusable widgets that can be used throughout a Flutter application.

## 📋 Experiment Objectives

The main objectives of this lab session are:
- Learn how to create custom widgets in Flutter
- Understand the concept of widget composition and reusability
- Implement custom TextField and Button widgets
- Practice passing callbacks and data between widgets
- Demonstrate proper widget architecture and design patterns

## 🏗️ Architecture & Components

### Custom Widgets Created

#### 1. **CustomTextField Widget**
- **Purpose:** A reusable text input field with customizable hint text
- **Features:**
  - Custom hint text support
  - Outlined border styling
  - Callback function for text changes
  - Real-time input monitoring

#### 2. **CustomButton Widget**
- **Purpose:** A standardized button component with custom text and actions
- **Features:**
  - Customizable button text
  - Custom onPressed callback functionality
  - Consistent styling across the application

### Widget Hierarchy
```
MyApp (StatelessWidget)
└── MaterialApp
    └── Scaffold
        ├── AppBar
        └── Column (Body)
            ├── CustomTextField (Name Input)
            ├── CustomTextField (Email Input)
            ├── CustomTextField (Roll Number Input)
            └── CustomButton (Action Button)
```

## 🚀 Features

### Input Fields
- **Name Input Field:** Captures user's name with real-time validation
- **Email Input Field:** Dedicated field for email address input
- **Roll Number Input Field:** Academic roll number entry

### Interactive Elements
- **Custom Button:** Triggers actions and provides user feedback
- **Real-time Feedback:** Console logging for all user interactions
- **Responsive Layout:** Properly spaced and centered UI elements

### UI/UX Features
- Clean and intuitive interface
- Consistent spacing and padding
- Outlined text field borders for better visibility
- Centered layout for optimal user experience

## 🛠️ Technical Implementation

### Key Concepts Demonstrated

1. **Widget Composition:** Building complex UI from simple, reusable components
2. **Callback Functions:** Implementing communication between parent and child widgets
3. **State Management:** Handling user input and widget interactions
4. **Custom Widget Creation:** Extending StatelessWidget for reusable components
5. **Property Passing:** Using constructors to pass data and functions to widgets

### Code Structure

#### CustomTextField Implementation
```dart
class CustomTextField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  
  // Constructor with required parameters
  // Build method with TextField and InputDecoration
}
```

#### CustomButton Implementation
```dart
class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  
  // Constructor with required parameters
  // Build method with ElevatedButton
}
```

## 📱 How to Run

### Prerequisites
- Flutter SDK installed
- Dart SDK installed
- An IDE (VS Code, Android Studio, or IntelliJ)
- Android/iOS emulator or physical device

### Running the Application

1. **Clone or Download** the project to your local machine
2. **Navigate** to the project directory:
   ```bash
   cd flutter_6a
   ```
3. **Install Dependencies:**
   ```bash
   flutter pub get
   ```
4. **Run the Application:**
   ```bash
   flutter run
   ```

## 🎮 How to Use

1. **Launch the App:** The application opens with a form containing three input fields
2. **Enter Information:**
   - Type your name in the "Enter your name" field
   - Enter your email in the "Enter Email" field
   - Input your roll number in the "Enter Roll Number" field
3. **Monitor Console:** All input changes are logged to the console in real-time
4. **Press Button:** Tap the "Press Me" button to trigger the button action
5. **View Feedback:** Check the console for interaction confirmations

## 🎓 Learning Outcomes

After completing this lab session, you will understand:

- **Custom Widget Creation:** How to build reusable UI components
- **Widget Communication:** Passing data and callbacks between widgets
- **Flutter Architecture:** Understanding StatelessWidget and widget composition
- **UI Design Patterns:** Creating consistent and maintainable user interfaces
- **Event Handling:** Managing user interactions and input validation
- **Code Reusability:** Writing modular code that can be reused across the application

## 🔧 Customization Options

### Extending the Custom Widgets

You can enhance the custom widgets by adding:

#### For CustomTextField:
- Input validation
- Different keyboard types
- Icon support
- Error message display
- Maximum length restrictions

#### For CustomButton:
- Different button styles (outlined, text, etc.)
- Custom colors and themes
- Loading states
- Icon support
- Size variations

### Example Enhancement:
```dart
// Enhanced CustomTextField with validation
class CustomTextField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  
  // Additional constructor parameters and validation logic
}
```

## 🐛 Troubleshooting

### Common Issues and Solutions

1. **Build Errors:** Ensure all required parameters are provided to custom widgets
2. **Console Output:** Make sure to check the debug console for interaction logs
3. **Hot Reload Issues:** Try hot restart if hot reload doesn't reflect changes
4. **Widget Errors:** Verify that all required constructors are properly implemented

## 📚 Additional Resources

- [Flutter Widget Catalog](https://docs.flutter.dev/development/ui/widgets)
- [Creating Custom Widgets](https://docs.flutter.dev/development/ui/widgets-intro)
- [Flutter Layout Widgets](https://docs.flutter.dev/development/ui/layout)
- [Widget Testing in Flutter](https://docs.flutter.dev/testing/widget-tests)

## 🎨 Screenshots

*Note: Run the application to see the custom widgets in action. The interface displays three input fields and one button, all created using custom widget implementations.*

## 📝 Notes

- This project focuses on **StatelessWidget** implementations for simplicity
- The custom widgets are designed to be **reusable** and **modular**
- Console logging is used for **debugging** and **interaction tracking**
- The layout uses **Column** and **Padding** for proper spacing and alignment

---

**Happy Learning! 🚀**

*This project demonstrates fundamental Flutter concepts that form the foundation for building scalable and maintainable mobile applications.*
