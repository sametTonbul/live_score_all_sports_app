import 'package:flutter/material.dart';

Widget goalStatus(int expandedTime, int homeGoal, int awayGoal) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$expandedTime',
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              '$homeGoal - $awayGoal',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 36,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
