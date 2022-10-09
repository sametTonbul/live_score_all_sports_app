import 'package:flutter/material.dart';
import 'package:flutter_smttnbl_sports_app/core/api_service.dart';
import 'package:flutter_smttnbl_sports_app/widgets/soccer_page_widget.dart';

class SoccerAppLiveScoreScreen extends StatefulWidget {
  const SoccerAppLiveScoreScreen({super.key});

  @override
  State<SoccerAppLiveScoreScreen> createState() =>
      _SoccerAppLiveScoreScreenState();
}

class _SoccerAppLiveScoreScreenState extends State<SoccerAppLiveScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
        title: const Text(
          'iSMT Live Score',
          style: TextStyle(color: Colors.white),
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
