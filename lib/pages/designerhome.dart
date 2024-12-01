import 'package:flutter/material.dart';
import 'package:boutiqa/pages/designer_home_page.dart';
import 'package:boutiqa/pages/search.dart';
import 'package:boutiqa/pages/designerprofile.dart';
import 'package:boutiqa/pages/create_post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:boutiqa/pages/userorders.dart";
class DesignFirstPage extends StatefulWidget {
  @override
  _DesignFirstPageState createState() => _DesignFirstPageState();
}

class _DesignFirstPageState extends State<DesignFirstPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    SearchPage(),
    OrderHistoryPage(),
    CreatePost(),

  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEDE1D3),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()),);
              },
              icon: Icon(Icons.person, size: 35,)),
        )],
      ),
      backgroundColor: Color(0xFFEDE3D8), // Background color
      body: _pages[_currentIndex], // Dynamic page switching
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Curved Gradient Background
          Container(
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.8),
                  Color(0xFF8B5E3C),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
          // Bottom Navigation Bar
          BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: onTabTapped,
            backgroundColor: Colors
                .transparent, // Set to transparent to show gradient background
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 30),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore, size: 30),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart, size: 30),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle, size: 30),
                label: 'Create',
              ),
            ],
          ),
        ],
      ),
    );
  }
}