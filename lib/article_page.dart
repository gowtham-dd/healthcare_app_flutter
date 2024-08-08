import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final List<Map<String, dynamic>> articleData = [
    {
      'articleTitle': 'Breakthrough in Cancer Treatment',
      'publisher': 'New England Journal of Medicine',
      'publishedDate': 'Published: March 15, 2024',
      'edition': 'Edition: Vol. 302, Issue 3',
      'imageUrl':
          'https://s3.amazonaws.com/production.scholastica/article/36705/small/nzmsj_34_jun22_0_front_cover.jpg?1656297904'
    },
    {
      'articleTitle': 'Revolutionizing Neurological Research',
      'publisher': 'Journal of Neuroscience',
      'publishedDate': 'Published: March 20, 2024',
      'edition': 'Edition: Vol. 45, Issue 5',
      'imageUrl':
          'https://s3.amazonaws.com/production.scholastica/article/36705/small/nzmsj_34_jun22_0_front_cover.jpg?1656297904'
    },
    {
      'articleTitle': 'Advances in Cardiac Surgery Techniques',
      'publisher': 'The Lancet',
      'publishedDate': 'Published: March 22, 2024',
      'edition': 'Edition: Vol. 410, Issue 8',
      'imageUrl':
          'https://s3.amazonaws.com/production.scholastica/article/36705/small/nzmsj_34_jun22_0_front_cover.jpg?1656297904'
    },
    {
      'articleTitle': 'Pediatric Health Innovations',
      'publisher': 'Pediatrics Journal',
      'publishedDate': 'Published: March 25, 2024',
      'edition': 'Edition: Vol. 112, Issue 2',
      'imageUrl':
          'https://s3.amazonaws.com/production.scholastica/article/36705/small/nzmsj_34_jun22_0_front_cover.jpg?1656297904'
    },
    {
      'articleTitle': 'Telemedicine: Bridging Gaps in Healthcare',
      'publisher': 'Journal of Telemedicine and Telecare',
      'publishedDate': 'Published: March 28, 2024',
      'edition': 'Edition: Vol. 20, Issue 4',
      'imageUrl':
          'https://s3.amazonaws.com/production.scholastica/article/36705/small/nzmsj_34_jun22_0_front_cover.jpg?1656297904'
    },
    // Add more article data entries with different image URLs
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
              itemCount: articleData.length,
              itemBuilder: (context, index) {
                final article = articleData[index];
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
                              image: NetworkImage(article['imageUrl']),
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
                                article['articleTitle']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Publisher: ${article['publisher']}',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                article['publishedDate']!,
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                article['edition']!,
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
