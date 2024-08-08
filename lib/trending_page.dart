import 'package:flutter/material.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({Key? key}) : super(key: key);

  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  final List<Map<String, dynamic>> trendingNews = [
    {
      'title': 'Medical Breakthrough: New Medicine Approved in India',
      'source': 'Healthline',
      'imageUrl':
          'https://lirp.cdn-website.com/69c0b277/dms3rep/multi/opt/Telmisartan+Tablet+Uses-+Side+Effects-+Composition+and+Price-1920w.jpg'
    },
    {
      'title': 'Unprecedented Medical Fraud Exposed: Authorities Investigating',
      'source': 'CNN Health',
      'imageUrl':
          'https://safety4sea.com/wp-content/uploads/2019/11/medical-fraud.png'
    },
    {
      'title':
          'Rare Medical Case Baffles Doctors: Patient Recovers Against Odds',
      'source': 'BBC Health',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_SoxYvE5OvnVtUNt-Emuk8z9tYeZSulkRI8A9VilnH0eQwkw7MB-4o6e-4lQLUaJxlF0&usqp=CAU'
    },
    {
      'title': 'Breakthrough Treatment for Rare Disease Goes Under Trial',
      'source': 'Reuters Health',
      'imageUrl':
          'https://www.thewmch.com/wp-content/uploads/2023/02/female-doctor-using-her-digital-tablet-free-vector.jpg'
    },
    {
      'title': 'New Study: Medical Cannabis Reduces Pain in Chronic Patients',
      'source': 'The Guardian Health',
      'imageUrl':
          'https://api.hub.jhu.edu/factory/sites/default/files/styles/soft_crop_1300/public/chronic-pain.jpg'
    },
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
              itemCount: trendingNews.length,
              itemBuilder: (context, index) {
                final news = trendingNews[index];
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
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(news['imageUrl']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                news['title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Source: ${news['source']}',
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
