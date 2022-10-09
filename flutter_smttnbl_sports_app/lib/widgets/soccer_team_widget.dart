import 'package:flutter/material.dart';

Widget teamStatus(String team, String logoUrl, String teamName) {
  return Expanded(
    child: Column(
      children: [
        Text(
          team,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Image.network(
            logoUrl,
            width: 48,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          teamName,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    ),
  );
}
