// screens/my_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/movie_provider.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    final myList = context.watch<MovieProvider>().myList;
    
    return Scaffold(
      appBar: AppBar(
        title: Text("My List (${myList.length})"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: myList.isEmpty
          ? const Center(
              child: Text(
                'No movies in your list yet!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: myList.length,
              itemBuilder: (_, index) {
                final currentMovie = myList[index];

                return Card(
                  key: ValueKey(currentMovie.title),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(currentMovie.title),
                    subtitle: Text(currentMovie.runtime ?? ''),
                    trailing: TextButton(
                      child: const Text(
                        'Remove',
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        context.read<MovieProvider>().removeFromList(currentMovie);
                      },
                    ),
                  ),
                );
              }),
    );
  }
}
