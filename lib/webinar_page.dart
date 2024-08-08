import 'package:flutter/material.dart';

class WebinarPage extends StatefulWidget {
  const WebinarPage({super.key});

  @override
  State<WebinarPage> createState() => _WebinarPageState();
}

class _WebinarPageState extends State<WebinarPage> {
  final List<Map<String, dynamic>> sessionData = [
    {
      'webinarTitle': 'Latest Cancer Research',
      'hospitalName': 'Ganga Hospital',
      'doctorName': 'Dr. John',
      'imageUrl':
          'https://media.licdn.com/dms/image/C5603AQFQ-lCJuLI1cw/profile-displayphoto-shrink_800_800/0/1517248232460?e=2147483647&v=beta&t=fKiuMLktZ3HwPWNdqRlUh3B4HCg4ZoafZ_GizQjoass', // Replace with actual image URL
    },
    {
      'webinarTitle': 'Advancements in Neurosurgery',
      'hospitalName': 'KMCH',
      'doctorName': 'Dr. Sethuraman',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuE271chrUyGMW8ohyYdvsZt8_vs6aFddipakhjUZLDQ&s', // Replace with actual image URL
    },
    {
      'webinarTitle': 'Future of Cardiology',
      'hospitalName': 'Apollo',
      'doctorName': 'Dr.Sarah',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSO4zQxffPqPBfZnTNF9ys1-mQI-erT3RbFNXw9t-eK1Q&s'
    },
    {
      'webinarTitle': 'Pediatric Health Innovations',
      'hospitalName': 'Fortis Hospital',
      'doctorName': 'Dr. Harshini',
      'imageUrl':
          'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/022011/fortis_logo.png?itok=uP3_kVd8'
    },
    {
      'webinarTitle': 'Latest Trends in Telemedicine',
      'hospitalName': 'Columbia Asia',
      'doctorName': 'Dr. David ',
      'imageUrl':
          'https://content3.jdmagicbox.com/comp/bangalore/l5/080pxx80.xx80.120509155818.l2l5/catalogue/columbia-asia-hospital-doddaballapur-bangalore-hospitals-uvfclswjme.jpg'
    },
    // Add more session data entries with different image URLs
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back button and search bar
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
            child: Row(
              children: [
                // Back button
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 16),
                // Search bar
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount:
                  sessionData.length, // Use the length of the sessionData list
              itemBuilder: (context, index) {
                // Access session data using the index
                final session = sessionData[index];

                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image on the left corner
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(session['imageUrl']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Heading of the webinar
                              Text(
                                session['webinarTitle']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 5),
                              // Hospital name and doctor name
                              Text(
                                'Presented by: ${session['hospitalName']}',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                'Doctor: ${session['doctorName']}',
                                style: TextStyle(
                                  color: Colors.grey[700],
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
        ],
      ),
    );
  }
}
