import 'package:wsafe/screens/counsel.dart';
import 'package:wsafe/screens/settingspage.dart';
import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:wsafe/screens/homepage.dart';

class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int navindex = 0;
  final List<Widget> pages = [
    const HomePage(),
    const CounselPage(),
    const SettingsPage()
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[navindex],
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Colors.redAccent.shade700,
        activeColor: Colors.white,
        selectedIndex: navindex,
    
        onButtonPressed: (index) => setState(() {
          navindex = index;
        }),
        barItems: [
          BarItem(title: 'Home', icon: Icons.home_rounded),
          BarItem(title: 'Councel', icon: Icons.people),
          BarItem(title: 'Settings', icon: Icons.settings),
        ],
      ),
    );
  }
}
