import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:medicallapp/webinar_page.dart';
import 'package:medicallapp/article_page.dart';
import 'package:medicallapp/trending_page.dart';
import 'package:medicallapp/live_session_page.dart';
import 'package:medicallapp/subscription_page.dart'; // Import SubscriptionPage

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late YoutubePlayerController _controller1;
  late YoutubePlayerController _controller2;
  late YoutubePlayerController _controller3; // Updated controller
  late YoutubePlayerController _controller4;

  @override
  void initState() {
    super.initState();
    _controller1 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
              'https://youtu.be/rO6t-d3291w?feature=shared') ??
          '',
      flags: YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
    _controller2 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
              'https://youtu.be/Y9dCauu0X3Y?feature=shared') ??
          '',
      flags: YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
    _controller3 = YoutubePlayerController(
      // Updated controller with new link
      initialVideoId: YoutubePlayer.convertUrlToId(
              'https://youtu.be/yTQ0tBmLbns?feature=shared') ??
          '',
      flags: YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
    _controller4 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
              'https://youtu.be/7rs79MUDId0?feature=shared') ??
          '',
      flags: YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MediTube',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector( // Wrap IconButton with GestureDetector
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SubscriptionPage()),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.subscriptions), // Subscription icon
                        SizedBox(width: 8),
                        Icon(Icons.notifications),
                        SizedBox(width: 8),
                        Icon(Icons.cast),
                        SizedBox(width: 8),
                        Icon(Icons.settings),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _buildMenuCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebinarPage()),
                        );
                      },
                      icon: Icons.book,
                      text: 'Webinars',
                      color1: Colors.blue.withOpacity(0.5),
                      color2: Colors.pink.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildMenuCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArticlePage()),
                        );
                      },
                      icon: Icons.newspaper,
                      text: 'Articles',
                      color1: Colors.pink.withOpacity(0.5),
                      color2: Colors.blue.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _buildMenuCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TrendingPage()),
                        );
                      },
                      icon: Icons.trending_up,
                      text: 'Trending',
                      color1: Colors.blue.withOpacity(0.5),
                      color2: Colors.pink.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildMenuCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LiveSessionPage()),
                        );
                      },
                      icon: Icons.camera_alt,
                      text: 'Live Session',
                      color1: Colors.pink.withOpacity(0.5),
                      color2: Colors.blue.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildYoutubeVideo(_controller1),
              SizedBox(height: 10),
              _buildYoutubeVideo(_controller2),
              SizedBox(height: 10),
              _buildYoutubeVideo(_controller3),
              SizedBox(height: 10),
              _buildYoutubeVideo(_controller4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard({
    required VoidCallback onTap,
    required IconData icon,
    required String text,
    required Color color1,
    required Color color2,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildYoutubeVideo(YoutubePlayerController controller) {
    return Column(
      children: [
        YoutubePlayer(
          controller: controller,
          liveUIColor: Colors.amber,
          showVideoProgressIndicator: true,
        ),
        SizedBox(height: 20), // Adding space between videos
      ],
    );
  }
}
