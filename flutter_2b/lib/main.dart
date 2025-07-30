import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Demos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LayoutDemoHome(),
    );
  }
}

class LayoutDemoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Layout Structures'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose a Layout Demo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RowLayoutDemo()),
                );
              },
              child: Text('Row Layout Demo'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ColumnLayoutDemo()),
                );
              },
              child: Text('Column Layout Demo'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StackLayoutDemo()),
                );
              },
              child: Text('Stack Layout Demo'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Row Layout Demo
class RowLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row Layout'),
        backgroundColor: Colors.red,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.blue,
            width: 100,
            height: 100,
          ),
        ],
      ),
    );
  }
}

// Column Layout Demo
class ColumnLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column Layout'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.blue,
            width: 100,
            height: 100,
          ),
        ],
      ),
    );
  }
}

// Stack Layout Demo
class StackLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Layout'),
        backgroundColor: Colors.purple,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            color: Colors.red,
            width: 200,
            height: 200,
          ),
          Container(
            color: Colors.green,
            width: 150,
            height: 150,
          ),
          Container(
            color: Colors.blue,
            width: 100,
            height: 100,
          ),
        ],
      ),
    );
  }
}

