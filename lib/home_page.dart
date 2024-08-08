import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:medicallapp/favorites_page.dart';
import 'package:medicallapp/home_first_page.dart';
import 'package:medicallapp/profile_page.dart';
import 'package:medicallapp/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of widgets to display based on the selected index
  final List<Widget> _widgetOptions = [
    HomeFirstPage(),
    SearchPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        child: GNav(
          color: Colors.black,
          activeColor: Colors.white,
          gap: 8,
          padding: EdgeInsets.all(20),
          tabBorderRadius: 15,
          tabBackgroundGradient:
              LinearGradient(colors: [Colors.blue, Colors.white]),
          onTabChange: _onItemTapped,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.favorite_border,
              text: 'Favorites',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
