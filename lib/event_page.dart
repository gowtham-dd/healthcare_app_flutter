import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  final void Function(String, String, String) onSubmit;

  const EventPage({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _hospitalNameController = TextEditingController();
  final TextEditingController _imageLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _eventNameController,
              decoration: InputDecoration(labelText: 'Event Name'),
            ),
            TextField(
              controller: _hospitalNameController,
              decoration: InputDecoration(labelText: 'Hospital Name'),
            ),
            TextField(
              controller: _imageLinkController,
              decoration: InputDecoration(labelText: 'Image Link'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final eventName = _eventNameController.text;
                final hospitalName = _hospitalNameController.text;
                final imageLink = _imageLinkController.text;
                widget.onSubmit(eventName, hospitalName, imageLink);
                Navigator.pop(
                    context); // Go back to the previous screen after submitting
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
