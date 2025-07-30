import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _data = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchDataFromApi();
  }

  Future<void> _fetchDataFromApi() async {
    setState(() {
      _isLoading = true;
    });
    
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    
    if (response.statusCode == 200) {
      setState(() {
        _data = json.decode(response.body);
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Data Example'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                return PostCard(
                  title: _data[index]['title'],
                  body: _data[index]['body'],
                );
              },
            ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String title;
  final String body;

  const PostCard({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              body,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
