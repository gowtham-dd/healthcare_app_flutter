import 'package:flutter/material.dart';
import 'package:medicallapp/booking_page.dart';
import 'package:medicallapp/utility/doctor_psy.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class DentistPage extends StatefulWidget {
  const DentistPage({super.key});

  @override
  State<DentistPage> createState() => _DentistPageState();
}

class _DentistPageState extends State<DentistPage> {
  List<Doctor> doctors = [
    Doctor(
      name: "Dr. Prabhu ",
      imageUrl: "https://cdn-icons-png.flaticon.com/512/4974/4974208.png",
      hospitalName: "GangaHospital",
      rating: 4.5,
    ),
    Doctor(
      name: "Dr. John ",
      imageUrl: "https://cdn-icons-png.flaticon.com/512/6505/6505657.png",
      hospitalName: "Kmch City Hospital",
      rating: 4.7,
    ),
    Doctor(
      name: "Dr. Durai",
      imageUrl: "https://cdn-icons-png.flaticon.com/512/6505/6505657.png",
      hospitalName: "Durai Clinic",
      rating: 4.7,
    ),
    Doctor(
      name: "Dr. Kiran",
      imageUrl: "https://cdn-icons-png.flaticon.com/512/4974/4974208.png",
      hospitalName: " Kiran Clinic",
      rating: 4.7,
    ),
    Doctor(
      name: "Dr. Harshini",
      imageUrl: "https://cdn-icons-png.flaticon.com/512/4974/4974208.png",
      hospitalName: "REX Hospital",
      rating: 4.8,
    ),
    Doctor(
      name: "Dr. Jeeva",
      imageUrl: "https://cdn-icons-png.flaticon.com/512/6505/6505657.png",
      hospitalName: "KG Hospital",
      rating: 4.7,
    ),
    Doctor(
      name: "Dr. Abi",
      imageUrl: "https://cdn-icons-png.flaticon.com/512/4974/4974208.png",
      hospitalName: "Ganga Hospital",
      rating: 4.6,
    ),
    Doctor(
      name: "Dr. Xavier",
      imageUrl: "https://cdn-icons-png.flaticon.com/512/6505/6505657.png",
      hospitalName: "Government Hospital",
      rating: 4.5,
    ),
    Doctor(
      name: "Dr. Josh",
      imageUrl: "https://cdn-icons-png.flaticon.com/512/6505/6505657.png",
      hospitalName: "KG Hospital",
      rating: 4.3,
    ),
    Doctor(
      name: "Dr. Guru",
      imageUrl: "https://cdn-icons-png.flaticon.com/512/6505/6505657.png",
      hospitalName: "Kmch City Hospital",
      rating: 4.1,
    ),
  ];

  List<Doctor> displayedDoctors = [];
  bool showFirstFive = true;

  @override
  void initState() {
    super.initState();
    updateDisplayedDoctors();
  }

  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      showFirstFive = !showFirstFive;
      updateDisplayedDoctors();
    });
  }

  void updateDisplayedDoctors() {
    displayedDoctors.clear();
    if (showFirstFive) {
      displayedDoctors.addAll(doctors.sublist(0, 5));
    } else {
      displayedDoctors.addAll(doctors.sublist(5));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent background color
        elevation: 0, // No shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 30), // Add space at the top
                  Material(
                    elevation: 5, // Add elevation
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none, // Remove border
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: LiquidPullToRefresh(
                color: Colors.blue.shade200,
                backgroundColor: Colors.white,
                springAnimationDurationInMilliseconds: 500,
                onRefresh: _refreshData,
                child: ListView.builder(
                  itemCount: displayedDoctors.length,
                  itemBuilder: (context, index) {
                    final doctor = displayedDoctors[index];
                    bool isEven = index % 2 == 0;
                    LinearGradient backgroundGradient = isEven
                        ? LinearGradient(
                            colors: [Colors.blue.shade400, Colors.white])
                        : LinearGradient(
                            colors: [Colors.pink.shade400, Colors.white]);
                    Color buttonColor =
                        isEven ? Colors.pink.shade200 : Colors.blue.shade200;

                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: backgroundGradient,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.network(
                              doctor.imageUrl,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(doctor.name,
                                      style: TextStyle(color: Colors.white)),
                                  Text(doctor.hospitalName,
                                      style: TextStyle(color: Colors.white)),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.star, color: Colors.amber),
                                      Text("${doctor.rating}",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    alignment: Alignment.center,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => BookingPage(),
                                          ),
                                        );
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                buttonColor),
                                      ),
                                      child: const Text(
                                        "Book Your Session",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
