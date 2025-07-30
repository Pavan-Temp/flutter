// screens/counter_screen.dart
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Example (setState)'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter Value:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: _decrementCounter,
                  tooltip: 'Decrement',
                  heroTag: "decrement",
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.remove, color: Colors.white),
                ),
                FloatingActionButton(
                  onPressed: _resetCounter,
                  tooltip: 'Reset',
                  heroTag: "reset",
                  backgroundColor: Colors.grey,
                  child: const Icon(Icons.refresh, color: Colors.white),
                ),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  heroTag: "increment",
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
