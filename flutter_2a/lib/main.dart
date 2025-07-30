import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Explorer - Lab Session 2',
      theme: ThemeData(
        // Enhanced theme with more styling options
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Widget Explorer - By Pooja'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // State variables for different widgets
  int _counter = 0;
  bool _isCheckboxChecked = false;
  String _selectedRadio = 'Option 1';
  String _selectedDropdown = 'Flutter';
  String _textFieldValue = '';
  double _sliderValue = 50.0;
  bool _switchValue = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Lab Session 2: Widget Explorer by Pooja'),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Widget Categories',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.widgets),
              title: const Text('Layout Widgets'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.text_fields),
              title: const Text('Input Widgets'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.touch_app),
              title: const Text('Button Widgets'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Counter Section - Original functionality
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Counter Widget Demo',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    const Text('You have pushed the button this many times:'),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: _incrementCounter,
                          icon: const Icon(Icons.add),
                          label: const Text('Increment'),
                        ),
                        ElevatedButton.icon(
                          onPressed: _resetCounter,
                          icon: const Icon(Icons.refresh),
                          label: const Text('Reset'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Input Widgets Section
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Input Widgets Demo',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    
                    // TextField
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Enter your name',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _textFieldValue = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    
                    // Display TextField value
                    if (_textFieldValue.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text('Hello, $_textFieldValue!'),
                      ),
                    
                    const SizedBox(height: 16),
                    
                    // Checkbox
                    CheckboxListTile(
                      title: const Text('I agree to the terms and conditions'),
                      value: _isCheckboxChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isCheckboxChecked = value ?? false;
                        });
                      },
                    ),
                    
                    // Radio Buttons
                    const Text('Choose your favorite:'),
                    RadioListTile<String>(
                      title: const Text('Option 1'),
                      value: 'Option 1',
                      groupValue: _selectedRadio,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedRadio = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Option 2'),
                      value: 'Option 2',
                      groupValue: _selectedRadio,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedRadio = value!;
                        });
                      },
                    ),
                    
                    // Dropdown
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Select Technology',
                        border: OutlineInputBorder(),
                      ),
                      value: _selectedDropdown,
                      items: ['Flutter', 'React Native', 'Xamarin', 'Native']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedDropdown = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Interactive Widgets Section
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Interactive Widgets Demo',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    
                    // Slider
                    Text('Slider Value: ${_sliderValue.round()}'),
                    Slider(
                      value: _sliderValue,
                      min: 0,
                      max: 100,
                      divisions: 10,
                      label: _sliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    ),
                    
                    // Switch
                    SwitchListTile(
                      title: const Text('Enable notifications'),
                      value: _switchValue,
                      onChanged: (bool value) {
                        setState(() {
                          _switchValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Button Widgets Section
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Button Widgets Demo',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    
                    // Different types of buttons
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Elevated'),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text('Outlined'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Text'),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite),
                        ),
                        FloatingActionButton.small(
                          onPressed: () {},
                          child: const Icon(Icons.star),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Layout Widgets Demo
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Layout Widgets Demo',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    
                    // Row example
                    const Text('Row Layout:'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.red,
                          child: const Center(child: Text('1')),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.green,
                          child: const Center(child: Text('2')),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.blue,
                          child: const Center(child: Text('3')),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Stack example
                    const Text('Stack Layout:'),
                    SizedBox(
                      height: 100,
                      child: Stack(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            color: Colors.orange,
                          ),
                          Positioned(
                            top: 20,
                            left: 20,
                            child: Container(
                              width: 60,
                              height: 60,
                              color: Colors.purple,
                            ),
                          ),
                          const Positioned(
                            bottom: 10,
                            right: 10,
                            child: Icon(Icons.star, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Image and Icon Section
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Image and Icon Widgets Demo',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    
                    // Icons row
                    const Text('Material Design Icons:'),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.home, size: 40, color: Colors.blue[600]),
                        Icon(Icons.favorite, size: 40, color: Colors.red[600]),
                        Icon(Icons.star, size: 40, color: Colors.amber[600]),
                        Icon(Icons.settings, size: 40, color: Colors.grey[600]),
                        Icon(Icons.person, size: 40, color: Colors.green[600]),
                      ],
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Placeholder for network image
                    const Text('Image Widget (placeholder):'),
                    const SizedBox(height: 8),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image, size: 40),
                            SizedBox(width: 8),
                            Text('Image Placeholder'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 100), // Space for FAB
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _incrementCounter,
        tooltip: 'Increment Counter',
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: 'Widgets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
        onTap: (index) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Tapped on tab $index'),
              duration: const Duration(seconds: 1),
            ),
          );
        },
      ),
    );
  }
}
