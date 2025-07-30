import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REST API Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _data = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchDataFromApi();
  }

  Future<void> _fetchDataFromApi() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      if (response.statusCode == 200) {
        setState(() {
          _data = json.decode(response.body);
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = 'Failed to load data. Status code: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Data Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchDataFromApi,
            tooltip: 'Refresh Data',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading posts...'),
                ],
              ),
            )
          : _error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _error!,
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _fetchDataFromApi,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    final post = _data[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Text(
                            '${post['id']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          post['title'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          post['body'],
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          _showPostDetails(context, post);
                        },
                      ),
                    );
                  },
                ),
    );
  }

  void _showPostDetails(BuildContext context, Map<String, dynamic> post) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Post #${post['id']}'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Title:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(post['title']),
                const SizedBox(height: 16),
                const Text(
                  'Body:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(post['body']),
                const SizedBox(height: 16),
                Text(
                  'User ID: ${post['userId']}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
