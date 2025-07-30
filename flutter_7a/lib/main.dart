import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  bool _subscribeToNewsletter = false;
  String _selectedCountry = 'USA';
  String _selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Example - Lab Session 7'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Personal Information Form',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                SizedBox(height: 20),
                
                // Name Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value;
                  },
                ),
                SizedBox(height: 20),
                
                // Email Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value;
                  },
                ),
                SizedBox(height: 20),
                
                // Newsletter Checkbox
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: _subscribeToNewsletter,
                      onChanged: (value) {
                        setState(() {
                          _subscribeToNewsletter = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        'Subscribe to Newsletter',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                
                // Gender Radio Buttons
                Text(
                  'Gender:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: <Widget>[
                    Radio<String>(
                      value: 'Male',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value!;
                        });
                      },
                    ),
                    Text('Male'),
                    Radio<String>(
                      value: 'Female',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value!;
                        });
                      },
                    ),
                    Text('Female'),
                    Radio<String>(
                      value: 'Other',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value!;
                        });
                      },
                    ),
                    Text('Other'),
                  ],
                ),
                SizedBox(height: 20),
                
                // Country Dropdown
                Row(
                  children: <Widget>[
                    Text(
                      'Country: ',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedCountry,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _selectedCountry = value!;
                          });
                        },
                        items: <String>['USA', 'Canada', 'UK', 'Australia', 'India', 'Germany', 'France']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                
                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Submit the form data
                        _showFormData(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                    child: Text('Submit Form'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showFormData(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Form Submitted Successfully!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: $_name'),
              Text('Email: $_email'),
              Text('Newsletter: ${_subscribeToNewsletter ? "Subscribed" : "Not Subscribed"}'),
              Text('Gender: $_selectedGender'),
              Text('Country: $_selectedCountry'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
    
    // Also print to console for debugging
    print('=== Form Data ===');
    print('Name: $_name');
    print('Email: $_email');
    print('Subscribe to Newsletter: $_subscribeToNewsletter');
    print('Gender: $_selectedGender');
    print('Country: $_selectedCountry');
    print('=================');
  }
}
