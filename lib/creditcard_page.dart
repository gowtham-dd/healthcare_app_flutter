import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:medicallapp/ticket_page.dart';

class CreditCardPage extends StatefulWidget {
  final String patientName;
  final int age;
  final String gender;

  const CreditCardPage({
    Key? key,
    required this.patientName,
    required this.age,
    required this.gender,
  }) : super(key: key);

  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;

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
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: showBackView,
              onCreditCardWidgetChange: (p0) {},
            ),
            CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                });
              },
              formKey: formKey,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showPaymentConfirmationDialog(context);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Container(
                height: 50,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.white],
                  ),
                ),
                child: Center(
                  child: Text(
                    'Pay Now',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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

  void _showPaymentConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Payment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Card Number: ${_cardNumber}'),
              Text('Expiry Date: ${_expiryDate}'),
              Text('Card Holder Name: ${_cardHolderName}'),
              Text('CVV Code: ${_cvvCode}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Navigate to TicketPage and pass the required arguments from CreditCardPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TicketPage(
                      selectedDate: DateTime.now(),
                      selectedTime: TimeOfDay.now(),
                      patientName: widget.patientName,
                      age: widget.age,
                      gender: widget.gender,
                    ),
                  ),
                );
              },
              child: Text('Confirm Payment'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  String get _cardNumber {
    return cardNumber;
  }

  String get _expiryDate {
    return expiryDate;
  }

  String get _cardHolderName {
    return cardHolderName;
  }

  String get _cvvCode {
    return cvvCode;
  }
}
