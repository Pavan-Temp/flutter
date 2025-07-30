import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Styling Demo',
      theme: ThemeData(
        // Define the overall theme of the app
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 18),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 4,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Styling Example'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Styled Container with custom decoration
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.blue.shade200, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.palette,
                      size: 50,
                      color: Colors.blue.shade600,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Welcome to Flutter Styling Demo',
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'This app demonstrates custom themes and styling in Flutter',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              
              // Custom styled button using theme
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Button pressed! Styling looks great!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                child: const Text('Get Started with Styling'),
              ),
              
              const SizedBox(height: 20),
              
              // Additional styled button with custom styling
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple.shade400, Colors.blue.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Gradient button pressed!'),
                        backgroundColor: Colors.purple,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text(
                    'Gradient Button',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Info card with custom styling
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.orange.shade600,
                        size: 30,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Styling Features',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '• Custom theme with primary colors\n'
                        '• Styled buttons and containers\n'
                        '• Custom fonts and text styles\n'
                        '• Gradient backgrounds\n'
                        '• Card layouts with shadows',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
