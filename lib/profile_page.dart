import 'package:flutter/material.dart';
import 'package:medicallapp/appoinmentem_page.dart';
import 'package:medicallapp/diet_plan.dart';
import 'package:medicallapp/event_data_model.dart';
import 'package:medicallapp/excercise_page.dart';
import 'package:medicallapp/expences_page.dart';
import 'package:provider/provider.dart';
import 'package:medicallapp/event_page.dart';
import 'package:medicallapp/favorites_page.dart';
import 'package:medicallapp/insurance_page.dart';
import 'package:medicallapp/medication_page.dart';
import 'package:medicallapp/health_analysis_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? _eventName;
  String? _hospitalName;
  String? _image;
  String? _exercise = '';
  String? _dietPlan = '';
  String? _expenses = '';

  // Define constants for container size and color
  static const double containerWidth = double.infinity;
  static const Color containerColor = Colors.white;

  void _handleEventSubmission(
      String eventName, String hospitalName, String imageLink) {
    setState(() {
      _eventName = eventName;
      _hospitalName = hospitalName;
      _image = imageLink;
    });

    Provider.of<EventDataModel>(context, listen: false).setEventData(
      EventData(
        eventName: eventName,
        hospitalName: hospitalName,
        imageLink: imageLink,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20), // Added SizedBox
            Container(
              width: containerWidth,
              child: Image.network(
                'https://img.freepik.com/premium-vector/young-man-face-avater-vector-illustration-design_968209-13.jpg',
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _buildCard('Gowtham'),
            _buildCard('Blood Group: AB+'),
            _buildCard('My Medications', onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MedicationPage()),
              );
            }),
            _buildCard('My Health Analysis', onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HealthAnalysisPage()),
              );
            }),
            _buildCard('My Tickets', onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesPage()),
              );
            }),
            _buildCard('My Insurance', onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InsurancePage()),
              );
            }),
            // Containers for exercise, diet plan, and expenses
            _buildCard('Exercise', onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExercisePage()),
              );
            }),
            _buildCard('Diet Plan', onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DietPlanPage()),
              );
            }),
            _buildCard('Expenses', onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExpensesPage()),
              );
            }),
             _buildCard('My Appointments', onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppointmentPage()),
              );
            }),
            _buildCard('Add an Event', onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventPage(
                    onSubmit: _handleEventSubmission,
                  ),
                ),
              );
            }),
            // Displaying event details if available
            if (_eventName != null && _hospitalName != null && _image != null)
              Column(
                children: [
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: containerWidth,
                      decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Image.network(
                            _image!,
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(height: 8),
                          Text(
                            _hospitalName!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(_eventName!),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for the button
                    },
                    child: Text('Add'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String text, {VoidCallback? onTap}) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(text),
        onTap: onTap,
      ),
    );
  }

  Widget _buildInfoContainer(String label, String? value,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: EdgeInsets.all(8),
        width: containerWidth,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(value ?? ''),
          ],
        ),
      ),
    );
  }
}
