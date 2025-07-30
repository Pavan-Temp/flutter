import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive UI Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResponsiveHomePage(),
    );
  }
}

class ResponsiveHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive UI Demo'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return _buildNarrowLayout();
          } else {
            return _buildWideLayout();
          }
        },
      ),
    );
  }

  Widget _buildNarrowLayout() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlutterLogo(size: 100),
          SizedBox(height: 20),
          Text(
            'Narrow Layout',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('Button'),
          ),
        ],
      ),
    );
  }

  Widget _buildWideLayout() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlutterLogo(size: 100),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Wide Layout',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('Button'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
