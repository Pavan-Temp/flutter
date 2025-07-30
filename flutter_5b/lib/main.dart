import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/movie_provider.dart';
import 'screens/home_screen.dart';
import 'screens/counter_screen.dart';

void main() {
  runApp(ChangeNotifierProvider<MovieProvider>(
    child: const MyApp(),
    create: (_) => MovieProvider(), // Create a new ChangeNotifier object
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'State Management Demo by Pooja',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management Demo'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Choose State Management Example:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            
            // setState Example Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CounterScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.calculate),
              label: const Text(
                'setState Example\n(Counter App)',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Provider Example Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.movie),
              label: const Text(
                'Provider Example\n(Movie List App)',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            
            const SizedBox(height: 40),
            
            const Card(
              color: Colors.lightBlue,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'About This Demo:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '• setState: Local state management within a single widget\n'
                      '• Provider: Global state management across multiple widgets\n'
                      '• Demonstrates stateful vs stateless widgets',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
