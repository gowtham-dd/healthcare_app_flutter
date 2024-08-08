// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:medicallapp/Kmch_page.dart';
import 'package:medicallapp/ai_page.dart';
import 'package:medicallapp/dentist_page.dart';
import 'package:medicallapp/ganga_page.dart';
import 'package:medicallapp/kg_page.dart';
import 'package:medicallapp/pediatrician_page.dart.dart';
import 'package:medicallapp/psg_page.dart';
import 'package:medicallapp/psychologist_page.dart';
import 'package:medicallapp/test_page.dart';
import 'package:medicallapp/utility/category_card.dart';

class HomeFirstPage extends StatefulWidget {
  const HomeFirstPage({Key? key}) : super(key: key);

  @override
  State<HomeFirstPage> createState() => _HomeFirstPageState();
}

class _HomeFirstPageState extends State<HomeFirstPage> {
  String? _eventName;
  String? _hospitalName;
  String? _imageLink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Gowtham',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onDoubleTap: () {
                      _showEmergencyDialog(context);
                    },
                    child: Image.network(
                      'https://img.freepik.com/premium-vector/young-man-face-avater-vector-illustration-design_968209-13.jpg',
                      height: 75,
                      width: 75,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue[200]!,
                            Colors.white,
                          ], // Specify your gradient colors
                          begin: Alignment
                              .topLeft, // Change the direction if needed
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.network(
                                'https://t4.ftcdn.net/jpg/06/32/90/79/360_F_632907942_M6CVHD1ivhUrWK1X49PkBlSH3ooNPsog.jpg', // Replace with your image URL
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'How do you feel?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      'Check out our new AI DOC!!',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 10),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => AiPage()),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.pink[100],
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                          child: Text(
                                            'Get Started',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 80,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DentistPage()),
                              );
                            },
                            child: CategoryCard(
                              categoryName: 'Dentist',
                              iconImagePath:
                                  'https://t3.ftcdn.net/jpg/03/06/12/48/360_F_306124857_EoRE4KeltvnQH1vN5adZYrkMlzzUc0Wh.jpg',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PsychologistPage()),
                              );
                            },
                            child: CategoryCard(
                              categoryName: 'Psychologist',
                              iconImagePath:
                                  'https://static.vecteezy.com/system/resources/previews/006/298/636/original/simple-psychology-logo-design-vector.jpg',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PediatricianPage()),
                              );
                            },
                            child: CategoryCard(
                              categoryName: 'Pediatrician',
                              iconImagePath:
                                  'https://www.graybill.org/wp-content/uploads/2013/07/pediatrics-icon.png',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PediatricianPage()),
                              );
                            },
                            child: CategoryCard(
                              categoryName: 'Dermatologist',
                              iconImagePath:
                                  'https://img.freepik.com/premium-vector/dermatology-skin-clinic-logo-template-design-brand-company-other_565941-409.jpg',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PediatricianPage()),
                              );
                            },
                            child: CategoryCard(
                              categoryName: 'Veterinary',
                              iconImagePath:
                                  'https://t4.ftcdn.net/jpg/01/47/27/35/360_F_147273516_rsoZM1qSExQQqdh0vEPrHVgm9sa2lTFT.jpg',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Up Coming Events...!',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('See all..',
                            style: TextStyle(fontWeight: FontWeight.normal)),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GangaPage()),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Material(
                                elevation: 6, // Add elevation for box shadow
                                borderRadius: BorderRadius.circular(
                                    8), // Add border radius
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    width:
                                        300, // Set a fixed width to the container
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          8), // Add border radius
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          // Center the image and title
                                          child: Image.network(
                                            'https://www.gangahospital.com/public/images/logo/logo_new1.jpg',
                                            height: 40,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Center(
                                          // Center the image and title
                                          child: Text(
                                            'GANGA ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Drug Awarness Rally on May"24',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => KmchPage()),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Material(
                                elevation: 6,
                                borderRadius: BorderRadius.circular(8),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Image.network(
                                            'https://kmchihsr.edu.in/images/header/logo.png',
                                            height: 50,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Center(
                                          child: Text(
                                            'KMCH ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Conference on Heart Diseases on April 29th ',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PsgPage()),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Material(
                                elevation: 6,
                                borderRadius: BorderRadius.circular(8),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Image.network(
                                            'https://pbs.twimg.com/profile_images/1069478595980980225/acPdKniQ_400x400.jpg',
                                            height: 50,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Center(
                                          child: Text(
                                            'PSG ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Marathon on 25th March ',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => KgHospitalPage()),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Material(
                                elevation: 6,
                                borderRadius: BorderRadius.circular(8),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Image.network(
                                            'https://cdn.hexahealth.com/Image/dc25740a-2138-4d23-a48f-632fe9024be7.jpg',
                                            height: 50,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Center(
                                          child: Text(
                                            'KG ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Blood Donation Camp 2nd Apr',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Event details section
                    if (_eventName != null &&
                        _hospitalName != null &&
                        _imageLink != null)
                      Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue[200]!,
                              Colors.white,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Event Details',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(height: 10),
                            Text('Event Name: $_eventName'),
                            Text('Hospital Name: $_hospitalName'),
                            Text('Image Link: $_imageLink'),
                          ],
                        ),
                      ),

                    SingleChildScrollView(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TestPage()),
                          );
                        },
                        child: Material(
                          elevation: 5, // Add elevation here
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 15.0),
                                        child: Text(
                                          'Take Your Depression Test Now!',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBk7apLIentbHZr9RUJLIF9roVjlSafKJCmipupuhHBw&s',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  void _showEmergencyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Emergency"),
          content: Text("Are you sure you want to send an emergency message?"),
          actions: [
            TextButton(
              onPressed: () {
                // Perform action on button press
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                print(
                    "Emergency message has sent to 9489202553 with your loation details");
              },
              child: Text("Send"),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  // Initialize Awesome Notifications with the channel configuration

  // Run the app with the home page
  runApp(MaterialApp(home: HomeFirstPage()));
}
