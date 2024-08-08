import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Appointment Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          AppointmentCard(
            imageUrl: 'https://cdn-icons-png.flaticon.com/512/6505/6505657.png',
            doctorName: 'Dr. Prabhu ',
            dateTime: 'April 30, 2024 - 3:00 PM',
            onlineMeetingLink: 'https://meet.google.com/ofr-gdbv-jwq',
          ),
          // Add more AppointmentCards as needed
        ],
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String imageUrl;
  final String doctorName;
  final String dateTime;
  final String onlineMeetingLink;

  const AppointmentCard({
    Key? key,
    required this.imageUrl,
    required this.doctorName,
    required this.dateTime,
    required this.onlineMeetingLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 4),
                Text(dateTime),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        // Handle online meeting button
                        if (await canLaunch(onlineMeetingLink)) {
                          await launch(onlineMeetingLink);
                        } else {
                          throw 'Could not launch $onlineMeetingLink';
                        }
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        color: Colors.blue,
                        child: Text(
                          'Online',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle offline meeting button
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        color: Colors.grey,
                        child: Text(
                          'Offline',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnlineMeetingPage extends StatelessWidget {
  final String meetingLink;

  OnlineMeetingPage(this.meetingLink);

  @override
  Widget build(BuildContext context) {
    // Handle navigation to online meeting link
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Meeting'),
      ),
      body: Center(
        child: Text('Join Meeting Here'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AppointmentPage(),
  ));
}
