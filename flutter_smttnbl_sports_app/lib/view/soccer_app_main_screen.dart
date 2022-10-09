import 'package:flutter/material.dart';
import 'package:flutter_smttnbl_sports_app/core/api_service.dart';
import 'package:flutter_smttnbl_sports_app/models/soccer_models.dart';
import 'package:flutter_smttnbl_sports_app/view/soccer_app_favourite_screen.dart';
import 'package:flutter_smttnbl_sports_app/view/soccer_app_fixture_screen.dart';
import 'package:flutter_smttnbl_sports_app/view/soccer_app_live_score_screen.dart';
import 'package:flutter_smttnbl_sports_app/widgets/soccer_page_widget.dart';

class SoccerAppMainScreen extends StatefulWidget {
  const SoccerAppMainScreen({super.key});

  @override
  State<SoccerAppMainScreen> createState() => _SoccerAppHomeState();
}

class _SoccerAppHomeState extends State<SoccerAppMainScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    const SoccerAppLiveScoreScreen(),
    const SoccerAppFixtureScreen(),
    const SoccerAppFavouriteScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<SoccerMatch>? matches;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    matches = await SoccerApi().getAllMatches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFFAFAFA),
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.redAccent,
            activeIcon: Icon(Icons.local_fire_department_sharp),
            icon: Icon(Icons.local_fire_department),
            label: 'LiVE SCORE',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blueGrey,
            activeIcon: Icon(Icons.location_city_outlined),
            icon: Icon(Icons.leak_remove),
            label: 'LEAGUES',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.brown,
            activeIcon: Icon(Icons.favorite_outlined),
            icon: Icon(Icons.favorite_outline_sharp),
            label: 'FAVOURITES',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
    );
  }
}
