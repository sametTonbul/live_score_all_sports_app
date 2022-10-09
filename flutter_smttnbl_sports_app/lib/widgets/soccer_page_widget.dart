import 'package:flutter/material.dart';
import 'package:flutter_smttnbl_sports_app/models/soccer_models.dart';
import 'package:flutter_smttnbl_sports_app/widgets/soccer_goal_widget.dart';
import 'package:flutter_smttnbl_sports_app/widgets/soccer_match_status.dart';
import 'package:flutter_smttnbl_sports_app/widgets/soccer_team_widget.dart';

// ignore: non_constant_identifier_names
Widget SoccerPageBody(List<SoccerMatch>? allMatches) {
  return Column(
    children: [
      Expanded(
        flex: 2,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                teamStatus('Home Team', allMatches![0].home.logoUrl,
                    allMatches[0].home.name),
                goalStatus(allMatches[0].fixture.status.elapsedTime,
                    allMatches[0].goal.home, allMatches[0].goal.away),
                teamStatus('Visitor Team', allMatches[0].home.logoUrl,
                    allMatches[0].away.name),
              ],
            ),
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF4373D9),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'MATCHES',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: allMatches.length,
                        itemBuilder: ((context, index) {
                          return matchStatus(allMatches[index]);
                        }))),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
