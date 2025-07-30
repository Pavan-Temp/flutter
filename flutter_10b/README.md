# Flutter Debugging Tools Demonstration 🐛🔧

**Project by:** Pooja  
**Experiment:** Flutter Debugging Tools - Identifying and Fixing Issues  
**Date:** July 30, 2025

## 📋 Project Overview

This Flutter project demonstrates the use of Flutter's debugging tools to identify and fix common issues in mobile app development. The project features a simple counter app with an intentionally introduced bug to showcase various debugging techniques and tools available in Flutter.

## 🎯 Experiment Objective

The main objective is to demonstrate how to:
- Use Flutter's debugging tools effectively
- Identify UI update issues using various debugging methods
- Fix common state management problems
- Understand the importance of `setState()` in Flutter

## 🐛 The Bug Scenario

The counter app has a deliberate bug where the counter value doesn't update in the UI when the "+" button is pressed, even though the increment function is being called. This simulates a real-world debugging scenario.

### Bug Details:
- **Issue:** Counter value doesn't update visually when button is pressed
- **Root Cause:** Missing `setState()` call in the `_incrementCounter()` method
- **Symptoms:** Button click is registered (console shows debug print), but UI doesn't refresh

## 🛠️ Debugging Tools Demonstrated

### 1. Debug Print Statements
```dart
void _incrementCounter() {
  print('Incrementing counter'); // Debug output
  _counter++; // Bug: Missing setState()
}
```

### 2. Widget Inspector
- Use Flutter Inspector to examine widget tree
- Verify button's `onPressed` callback is properly wired
- Check widget properties and state

### 3. Debug Console
- Monitor console output for debug statements
- Verify method calls are being executed
- Track application flow

### 4. Breakpoints
- Set breakpoints in critical methods
- Step through code execution
- Inspect variable values at runtime

## 🚀 How to Run the Project

### Prerequisites
- Flutter SDK installed
- VS Code or Android Studio with Flutter extensions
- An emulator or physical device

### Running the App
```bash
# Navigate to project directory
cd flutter_10b

# Get dependencies
flutter pub get

# Run in debug mode
flutter run --debug
```

### Testing the Bug
1. Launch the app in debug mode
2. Tap the "+" floating action button
3. Observe that:
   - Console shows "Incrementing counter" message
   - Counter value in UI remains 0 (the bug!)

## 🔧 Debugging Process

### Step 1: Widget Inspector Analysis
1. Enable Flutter Inspector in your IDE
2. Select the FloatingActionButton widget
3. Verify `onPressed` is correctly set to `_incrementCounter`

### Step 2: Console Debugging
1. Check debug console when button is pressed
2. Confirm "Incrementing counter" message appears
3. This proves the method is being called

### Step 3: Breakpoint Debugging
1. Set breakpoint in `_incrementCounter()` method
2. Run app in debug mode
3. Press button and observe execution flow
4. Check if `_counter` variable value increases

### Step 4: Identifying the Root Cause
The debugging process reveals:
- ✅ Button callback is working
- ✅ Method is being called
- ✅ Variable value is incrementing
- ❌ UI is not updating

**Conclusion:** Missing `setState()` call!

## 🩹 The Fix

To fix the bug, wrap the counter increment in `setState()`:

```dart
void _incrementCounter() {
  setState(() {
    print('Incrementing counter');
    _counter++;
  });
}
```

## 📱 App Features

- **Simple Counter UI:** Clean, minimalist design
- **Debug-Friendly:** Includes console output for tracking
- **Educational:** Perfect for learning debugging techniques
- **Cross-Platform:** Works on iOS, Android, Web, and Desktop

## 🎨 UI Components

- `AppBar`: Blue header with title
- `Column`: Centered layout with counter display
- `FloatingActionButton`: Blue "+" button for incrementing
- `Text Widgets`: Display counter label and value

## 📚 Learning Outcomes

After completing this debugging exercise, you will understand:

1. **State Management Importance:** Why `setState()` is crucial in Flutter
2. **Debugging Workflow:** Systematic approach to finding bugs
3. **Tool Proficiency:** How to use Flutter's debugging tools effectively
4. **Problem-Solving Skills:** Breaking down complex issues into smaller parts

## 🔍 Additional Debugging Tips

1. **Use Flutter Inspector:** Great for widget tree analysis
2. **Enable Debug Mode:** Always run `flutter run --debug` during development
3. **Console Logging:** Use `print()` statements strategically
4. **Breakpoints:** Set them at critical execution points
5. **Hot Reload:** Test fixes quickly without full restart

## 📁 Project Structure

```
lib/
├── main.dart          # Main app entry point with counter logic
test/
├── widget_test.dart   # Unit tests for the app
```

## 🤝 Contributing

This is an educational project by Pooja. Feel free to:
- Fork the repository
- Try different debugging scenarios
- Add more debugging examples
- Share your debugging experiences

## 📞 Support

If you encounter issues or have questions about Flutter debugging:
- Check Flutter documentation
- Use Flutter community forums
- Experiment with different debugging approaches

---

**Happy Debugging! 🐛➡️✅**  
*Remember: Every bug is a learning opportunity!*
