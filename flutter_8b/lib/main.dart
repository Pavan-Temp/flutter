import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Examples',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimationHomePage(),
    );
  }
}

class AnimationHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Animation Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose an Animation Type',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FadeAnimationPage()),
                );
              },
              child: Text('Fade Animation'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SlideAnimationPage()),
                );
              },
              child: Text('Slide Animation'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScaleAnimationPage()),
                );
              },
              child: Text('Scale Animation'),
            ),
          ],
        ),
      ),
    );
  }
}

// Fade Animation Implementation
class FadeAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fade Animation Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FadeAnimation(),
    );
  }
}

class FadeAnimation extends StatefulWidget {
  @override
  _FadeAnimationState createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: _animation,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Fade Animation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              _controller.reset();
              _controller.forward();
            },
            child: Text('Restart Animation'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// Slide Animation Implementation
class SlideAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slide Animation Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SlideAnimation(),
    );
  }
}

class SlideAnimation extends StatefulWidget {
  @override
  _SlideAnimationState createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideTransition(
            position: _animation,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Slide Animation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              _controller.reset();
              _controller.forward();
            },
            child: Text('Restart Animation'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// Scale Animation Implementation
class ScaleAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scale Animation Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ScaleAnimation(),
    );
  }
}

class ScaleAnimation extends StatefulWidget {
  @override
  _ScaleAnimationState createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: _animation,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Scale Animation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              _controller.reset();
              _controller.forward();
            },
            child: Text('Restart Animation'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
