import 'package:flutter/material.dart';
import 'package:flutter_smttnbl_sports_app/core/api_service.dart';
import 'package:flutter_smttnbl_sports_app/models/soccer_models.dart';
import 'package:flutter_smttnbl_sports_app/widgets/soccer_page_widget.dart';

class SoccerAppLiveScoreScreen extends StatefulWidget {
  const SoccerAppLiveScoreScreen({super.key});

  @override
  State<SoccerAppLiveScoreScreen> createState() =>
      _SoccerAppLiveScoreScreenState();
}

class _SoccerAppLiveScoreScreenState extends State<SoccerAppLiveScoreScreen> {
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
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'iSMT Live Score',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: SoccerApi().getAllMatches(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SoccerPageBody(snapshot.data);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
