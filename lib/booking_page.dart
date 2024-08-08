import 'package:flutter/material.dart';
import 'package:medicallapp/creditcard_page.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  TextEditingController _patientNameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _genderController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  // Image below the app bar
                  Center(
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/4974/4974208.png',
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Patient details text fields
                  buildElevatedTextField(
                    context,
                    ' Name',
                    controller: _patientNameController,
                    elevation: 3,
                  ),
                  SizedBox(height: 20), // Spacer
                  buildElevatedTextField(
                    context,
                    'Age',
                    controller: _ageController,
                    elevation: 3,
                  ),
                  SizedBox(height: 20), // Spacer
                  buildElevatedTextField(
                    context,
                    'Gender',
                    controller: _genderController,
                    elevation: 3,
                  ),
                  SizedBox(height: 20), // Spacer
                  buildDateTextField(context, elevation: 5),
                  SizedBox(height: 20), // Spacer
                  // Text box height
                  buildTimeTextField(context, elevation: 3),
                  SizedBox(height: 20), // Spacer for consistent spacing
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showPaymentMethods(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'PAYMENT',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildDateTextField(BuildContext context, {required double elevation}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: elevation,
            blurRadius: elevation,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        readOnly: true,
        onTap: () => _selectDate(context),
        decoration: InputDecoration(
          labelText: 'Date',
          prefixIcon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        controller: TextEditingController(
          text: _selectedDate != null
              ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
              : '',
        ),
      ),
    );
  }

  Widget buildTimeTextField(BuildContext context, {required double elevation}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: elevation,
            blurRadius: elevation,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        readOnly: true,
        onTap: () => _selectTime(context),
        decoration: InputDecoration(
          labelText: 'Time',
          prefixIcon: Icon(Icons.access_time),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(16),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        controller: TextEditingController(
          text: _selectedTime != null
              ? '${_selectedTime!.hour}:${_selectedTime!.minute}'
              : '',
        ),
      ),
    );
  }

  Widget buildElevatedTextField(BuildContext context, String labelText,
      {required TextEditingController controller, required double elevation}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: elevation,
            blurRadius: elevation,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  void _showPaymentMethods(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Payment Method'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.account_balance_wallet),
                title: Text('UPI'),
                onTap: () {
                  // Handle UPI payment method
                  Navigator.pop(context);
                  // Navigate to CreditCardPage with required arguments
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreditCardPage(
                        patientName: _patientNameController.text,
                        age: int.parse(_ageController.text),
                        gender: _genderController.text,
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.credit_card),
                title: Text('Credit Card'),
                onTap: () {
                  // Handle credit card payment method
                  Navigator.pop(context);
                  // Navigate to CreditCardPage with required arguments
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreditCardPage(
                        patientName: _patientNameController.text,
                        age: int.parse(_ageController.text),
                        gender: _genderController.text,
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.credit_card),
                title: Text('Debit Card'),
                onTap: () {
                  // Handle debit card payment method
                  Navigator.pop(context);
                  // Navigate to CreditCardPage with required arguments
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreditCardPage(
                        patientName: _patientNameController.text,
                        age: int.parse(_ageController.text),
                        gender: _genderController.text,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BookingPage(),
  ));
}
