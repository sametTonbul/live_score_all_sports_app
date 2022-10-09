import 'package:flutter/material.dart';
import 'package:flutter_smttnbl_sports_app/models/soccer_models.dart';
import 'package:flutter_smttnbl_sports_app/widgets/soccer_match_status.dart';

// ignore: non_constant_identifier_names
Widget SoccerPageBody(List<SoccerMatch>? allMatches) {
  return Column(
    children: [
      Expanded(
        flex: 5,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF203A43),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Live',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 24,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: allMatches!.length,
                    itemBuilder: ((context, index) {
                      return matchStatus(allMatches[index]);
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
