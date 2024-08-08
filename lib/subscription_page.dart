import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'search_page.dart'; // Import the SearchPage

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('MediTube'),
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to SearchPage when search icon is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.cast),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Subscriptions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) {
                  // List of image URLs for avatars
                  List<String> avatarUrls = [
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcIWy4k1vm06cpXAloLSZKhhG61zqhkZ7dkR1hqlg48Q&s',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4H-LrYZ25Ytsa4DbgAWzQ3kist4mRkDQRbvHNwsO6DQ&s',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgKh2eA9_ayR5_bALtvPO8SVvU40RFgIssUSgm2UOSUg&s',
                    'https://storage.googleapis.com/aims-edu/images/000/000/722/image/default-image-aims.png',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuRl9d7d92i9p54Iw2cWEHJMqcrY4QXUeoIIRAFdzYVw&s',
                    'https://ceoreviewmagazine.com/wp-content/uploads/2021/07/Top-10-Fintech-Companies-in-USA.png',
                    'https://www.karosearch.com/images/uploads/original/31879_logo_ganga_multispeciality_hospital.jpg',
                    'https://pbs.twimg.com/profile_images/1069478595980980225/acPdKniQ_400x400.jpg',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShnUXW3-6HJ_kNChkCmf4kwk9ywy1DwSZ8snCXhygcnA&s',
                    'https://www.alafiyameditour.com/wp-content/uploads/2019/06/Fortis-hospitals-logo-HBG-Medical-Assistance.jpg',
                    // Add more URLs as needed
                  ];

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(avatarUrls[index % avatarUrls.length]),
                      radius: 50,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 40), // Increased space between sections
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Today\'s Videos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    // List of YouTube video links
                    List<String> videoLinks = [
                      'https://youtu.be/9zlUNw3y5rg?feature=shared',
                      'https://youtu.be/8jPQjjsBbIc?feature=shared',
                      'https://youtu.be/LNHBMFCzznE?feature=shared',
                    ];

                    // List of additional bold texts for each video
                    List<String> additionalTexts = [
                      "Let's talk about healthcare in 2030 | Dr Marcus Ranney | TEDxSurat",
                      "After watching this, your brain will not be the same | Lara Boyd | TEDxVancouver",
                      "How to stay calm when you know you'll be stressed | Daniel Levitin | TED"
                    ];

                    // Ensure that the index is within the range of the videoLinks list
                    if (index < videoLinks.length) {
                      String? videoId =
                          YoutubePlayer.convertUrlToId(videoLinks[index]);

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Video thumbnail here
                                  YoutubePlayer(
                                    controller: YoutubePlayerController(
                                      initialVideoId: videoId ?? '',
                                      flags:
                                          YoutubePlayerFlags(autoPlay: false),
                                    ),
                                    showVideoProgressIndicator: true,
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Removed Text widget that displayed the index number
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.thumb_up),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.thumb_down),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.watch_later),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              additionalTexts[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      );
                    } else {
                      return SizedBox
                          .shrink(); // Return an empty widget if index is out of range
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
