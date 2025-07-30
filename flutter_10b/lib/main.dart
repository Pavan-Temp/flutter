import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterApp(),
    );
  }
}

class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  // BUG: Missing setState() call - this is the debugging issue
  void _incrementCounter() {
    print('Incrementing counter'); // Debug print statement
    _counter++; // Bug: No setState() call to trigger UI update
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App - Debugging Demo'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Tap the + button to increment',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
