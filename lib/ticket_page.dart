import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

class TicketPage extends StatelessWidget {
  final String patientName;
  final int age;
  final String gender;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;

  const TicketPage({
    Key? key,
    required this.patientName,
    required this.age,
    required this.gender,
    required this.selectedDate,
    required this.selectedTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // Show back button
        // Remove app bar title
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.network(
                'https://lh3.googleusercontent.com/pSlrLS5TNjYuViAVhr8NnbgWI-6_i5irI4jRonsJ9a4V313nbGdlNwkiuqww4AgGOzI=h315',
                height: 150,
                width: 400,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 400, // Increased container height
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Patient Name: $patientName',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Age: $age',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Gender: $gender',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Appointment Details:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Date: ${selectedDate != null ? selectedDate!.toString().substring(0, 10) : 'Not selected'}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Time: ${selectedTime != null ? selectedTime!.format(context) : 'Not selected'}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Image.network(
                          'https://freepngtransparent.com/wp-content/uploads/2023/03/barcode-png-133.png',
                          height: 100,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: _launchMaps,
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
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
                  child: Center(
                    child: Text(
                      'View',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to open maps with the location of Nehru Arts and Science College
  void _launchMaps() {
    MapsLauncher.launchQuery('hospitals near Nehru College Coimbatore');
  }
}
