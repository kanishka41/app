import 'package:app/features/user_auth/presentation/pages/Dashboard.dart/home/home.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _babyNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _scheduleDobController = TextEditingController();
  String _gender = '';
  String? _babyNameError;
  String? _dobError;
  bool _isPremature = false;
  List<bool> _selections = [true, false];
  bool _showScheduleDOB = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color.fromARGB(255, 215, 239, 251),
      ),
      backgroundColor: Color.fromARGB(255, 215, 239, 251),
      body: SingleChildScrollView(
        // Wrap the Scaffold body with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your baby details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _babyNameController,
                            decoration: InputDecoration(
                              labelText: 'Baby Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  _babyNameError =
                                      'Please enter your baby name';
                                });
                                return null;
                              }
                              setState(() {
                                _babyNameError = null;
                              });
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          if (_babyNameError != null)
                            Text(
                              _babyNameError!,
                              style: TextStyle(color: Colors.red),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ToggleButtons(
                          children: [
                            Container(
                              width: 158,
                              height: 40,
                              alignment: Alignment.center,
                              child: Text('Boy'),
                            ),
                            Container(
                              width: 159,
                              height: 40,
                              alignment: Alignment.center,
                              child: Text('Girl'),
                            ),
                          ],
                          isSelected: _selections,
                          onPressed: (int index) {
                            setState(() {
                              for (int buttonIndex = 0;
                                  buttonIndex < _selections.length;
                                  buttonIndex++) {
                                if (buttonIndex == index) {
                                  _selections[buttonIndex] = true;
                                } else {
                                  _selections[buttonIndex] = false;
                                }
                              }
                              _gender = _selections[0] ? 'Boy' : 'Girl';
                            });
                          },
                          fillColor: Colors.blue,
                          selectedColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        _selectDate(context, _dobController);
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: _dobController,
                          decoration: InputDecoration(
                            labelText: 'Date of Birth',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Is the baby premature?',
                          style: TextStyle(fontSize: 16),
                        ),
                        Checkbox(
                          value: _isPremature,
                          onChanged: (value) {
                            setState(() {
                              _isPremature = value!;
                              if (_isPremature) {
                                _showScheduleDOB = true;
                              } else {
                                _showScheduleDOB = false;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    if (_showScheduleDOB) ...[
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          _selectDate(context, _scheduleDobController);
                        },
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: _scheduleDobController,
                            decoration: InputDecoration(
                              labelText: 'Schedule Date of Birth',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _submitForm(context);
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
    );
    if (pickedDate != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  void _submitForm(BuildContext context) {
    final babyName = _babyNameController.text;
    final dob = _dobController.text;
    final scheduleDob = _scheduleDobController.text;

    print('Baby Name: $babyName');
    print('Gender: $_gender');
    print('Date of Birth: $dob');
    print('Is Premature: $_isPremature');
    if (_isPremature) {
      print('Schedule Date of Birth: $scheduleDob');
    }

    if (babyName.isNotEmpty &&
        dob.isNotEmpty &&
        ((_isPremature && scheduleDob.isNotEmpty) || !_isPremature)) {
      // Navigate to a new page after submitting the form
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardPage(),
        ),
      );

      _formKey.currentState!.reset();
      _babyNameController.clear();
      _dobController.clear();
      _scheduleDobController.clear();
      setState(() {
        _gender = '';
        _isPremature = false;
        _showScheduleDOB = false;
      });
    } else {
      // Show an error message if any required field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill the form.'),
        ),
      );
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
