import 'package:flutter/material.dart';
import 'package:app/features/user_auth/presentation/pages/Dashboard.dart/home/home.dart';
import 'package:app/features/user_auth/presentation/pages/Dashboard.dart/Knowledge/Knowledge.dart';
import 'package:app/features/user_auth/presentation/pages/Dashboard.dart/nutrition/nutrition.dart';

class VaccinationPage extends StatefulWidget {
  @override
  _VaccinationPageState createState() => _VaccinationPageState();
}

class _VaccinationPageState extends State<VaccinationPage> {
  int _selectedIndex = 3; // Set the initial index to 3 for VaccinationPage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccination'),
        backgroundColor: Color.fromARGB(255, 215, 239, 251),
      ),
      backgroundColor: Color.fromARGB(255, 215, 239, 251),
      body: PageView(
        // Wrap with PageView
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Child Vaccination Details
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Child Vaccination Details',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          // Add your child vaccination details content here
                          Text('Child Name: John Doe'),
                          Text('Date of Birth: January 1, 2020'),
                          Text('Next vaccination: 28th February 2024'),
                          Text('Vaccine: MMR'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Vaccination Tracker
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Vaccination Tracker',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          // Add your vaccination tracker content here
                          ListTile(
                            leading: Icon(Icons.check_circle),
                            title: Text('Polio - Completed'),
                          ),
                          ListTile(
                            leading: Icon(Icons.check_circle),
                            title: Text('MMR - Due on 28th February 2024'),
                          ),
                          ListTile(
                            leading: Icon(Icons.check_circle_outline),
                            title: Text('DTaP - Pending'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Doctor Section
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Doctor',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          // Add your doctor section content here
                          ListTile(
                            leading: Icon(Icons.person),
                            title: Text('Dr. John Doe'),
                            subtitle: Text('Pediatrician'),
                          ),
                          ListTile(
                            leading: Icon(Icons.phone),
                            title: Text('Contact'),
                            subtitle: Text('+1234567890'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Knowledge',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Nutrition',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Vaccination',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KnowledgePage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NutritionPage()),
            );
          }
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
