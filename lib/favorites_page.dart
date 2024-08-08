import 'package:flutter/material.dart';
import 'package:medicallapp/utility/doctor_psy.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<Doctor> doctors = [
    Doctor(
      name: "Dr. Emily ",
      imageUrl: "https://cdn-icons-png.flaticon.com/512/4974/4974208.png",
      hospitalName: "GangaHospital",
      rating: 4.5,
    ),
    Doctor(
      name: "KMCH",
      imageUrl: "https://cdn-icons-png.flaticon.com/512/6505/6505657.png",
      hospitalName: "Conference onHeartSurgery",
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
  ];

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
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    final doctor = doctors[index];
                    bool isEven = index % 2 == 0;
                    LinearGradient backgroundGradient = LinearGradient(
                      colors: isEven
                          ? [Colors.blue.shade300, Colors.blue.shade100]
                          : [Colors.pink.shade300, Colors.pink.shade100],
                    );
                    Color buttonColor =
                        isEven ? Colors.pink.shade200 : Colors.blue.shade200;
                    Color buttonTextColor =
                        isEven ? Colors.blue.shade300 : Colors.pink.shade300;

                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: backgroundGradient,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(doctor.name,
                                          style:
                                              TextStyle(color: Colors.white)),
                                      Text(doctor.hospitalName,
                                          style:
                                              TextStyle(color: Colors.white)),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.star, color: Colors.amber),
                                          Text("${doctor.rating}",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                // Implement view ticket functionality
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: isEven
                                    ? Colors.pink.shade200
                                    : Colors.blue
                                        .shade200, // Adjusted color based on container gradient
                              ),
                              child: Text(
                                'View Ticket',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors
                                        .black // Adjusted text color based on container gradient
                                    ),
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

  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 2));
    // Implement refresh logic here if needed
  }
}
