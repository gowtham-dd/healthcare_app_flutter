import 'package:flutter/material.dart';

class MedicationPage extends StatefulWidget {
  const MedicationPage({Key? key}) : super(key: key);

  @override
  State<MedicationPage> createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> {
  TextEditingController _textController = TextEditingController();
  List<String> _medications = [
    'Antibiotic Ointment',
    'Hydrocortisone Cream',
    'Vitamin D Supplement',
    'Fish Oil Supplement',
    'Probiotic Capsule',
    'Antihistamine Tablet',
    'Zinc Supplement',
    'Moisturizing Lotion',
    'Sunscreen SPF 50',
    'Acne Treatment Gel'
  ];

  String? _selectedTablet;
  int _timesPerDay = 1;
  int _numberOfDays = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Type medication name',
                suffixIcon: IconButton(
                  onPressed: () {
                    String newMedication = _textController.text.trim();
                    if (newMedication.isNotEmpty) {
                      setState(() {
                        _medications.add(newMedication);
                        _textController.clear();
                      });
                    }
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _medications.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text(_medications[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_circle),
                        onPressed: () {
                          setState(() {
                            _medications.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Add Medication',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedTablet,
                    hint: Text('Select Tablet'),
                    onChanged: (value) {
                      setState(() {
                        _selectedTablet = value;
                      });
                    },
                    items: _medications.map((tablet) {
                      return DropdownMenuItem<String>(
                        value: tablet,
                        child: Text(tablet),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('Times per day:'),
                      SizedBox(width: 10),
                      DropdownButton<int>(
                        value: _timesPerDay,
                        onChanged: (value) {
                          setState(() {
                            _timesPerDay = value!;
                          });
                        },
                        items: [1, 2, 3, 4, 5].map((times) {
                          return DropdownMenuItem<int>(
                            value: times,
                            child: Text(times.toString()),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('Number of days:'),
                      SizedBox(width: 10),
                      DropdownButton<int>(
                        value: _numberOfDays,
                        onChanged: (value) {
                          setState(() {
                            _numberOfDays = value!;
                          });
                        },
                        items: [1, 2, 3, 4, 5, 6, 7].map((days) {
                          return DropdownMenuItem<int>(
                            value: days,
                            child: Text(days.toString()),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Add medication logic
                      print('Selected Tablet: $_selectedTablet');
                      print('Times Per Day: $_timesPerDay');
                      print('Number of Days: $_numberOfDays');
                    },
                    child: Text('Add Medication'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
