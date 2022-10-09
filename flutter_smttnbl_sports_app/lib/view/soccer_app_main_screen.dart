import 'package:flutter/material.dart';
import 'package:flutter_smttnbl_sports_app/view/soccer_app_fixture_screen.dart';
import 'package:flutter_smttnbl_sports_app/view/soccer_app_live_score_screen.dart';
import 'package:flutter_smttnbl_sports_app/view/soccer_app_profile_screen.dart';

class SoccerAppMainScreen extends StatefulWidget {
  const SoccerAppMainScreen({super.key});

  @override
  State<SoccerAppMainScreen> createState() => _SoccerAppHomeState();
}

class _SoccerAppHomeState extends State<SoccerAppMainScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    const SoccerAppLiveScore2Screen(),
    const SoccerAppFixtureScreen(),
    const SoccerAppProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFFAFAFA),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department),
            label: 'Live Score',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Fixtures',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
    );
  }
}
