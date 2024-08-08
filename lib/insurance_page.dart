import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class InsurancePage extends StatelessWidget {
  final List<Map<String, dynamic>> insuranceCards = [
    {
      'title': 'Health Insurance Card',
      'imageUrl':
          'https://img.freepik.com/premium-vector/young-man-face-avater-vector-illustration-design_968209-13.jpg',
      'name': 'Gowtham',
      'age': 20,
      'membershipID': '1234567890',
      'validDate': '2025-01-01',
      'gradient': LinearGradient(
        colors: [Colors.blue, Colors.lightBlueAccent],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    },
    // Add more insurance card data...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 25), // Add sized box at the top
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 55.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height *
                    0.4, // Adjust card height
                child: Swiper(
                  itemWidth: MediaQuery.of(context).size.width *
                      0.6, // Adjust card width
                  itemHeight: null, // Let the height adjust based on content
                  itemBuilder: (context, index) {
                    final card = insuranceCards[index];
                    return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(8), // Reduce padding
                      decoration: BoxDecoration(
                        gradient: card['gradient'],
                        borderRadius:
                            BorderRadius.circular(8), // Reduce border radius
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            card['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16, // Reduce font size
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5), // Reduce spacing
                          Row(
                            children: [
                              Image.network(
                                card['imageUrl'],
                                width: 60, // Reduce image size
                                height: 60, // Reduce image size
                              ),
                              SizedBox(width: 5), // Reduce spacing
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      card['name'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14, // Reduce font size
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'ID: ${card['membershipID']}',
                                      style: TextStyle(
                                        fontSize: 12, // Reduce font size
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Valid Until: ${card['validDate']}',
                                      style: TextStyle(
                                        fontSize: 12, // Reduce font size
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Age: ${card['age']}',
                                      style: TextStyle(
                                        fontSize: 12, // Reduce font size
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: insuranceCards.length,
                  pagination: null, // Remove the pagination dots
                  control: null, // Remove the arrow marks on both sides
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
