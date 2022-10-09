import 'package:flutter/material.dart';
import 'package:flutter_smttnbl_sports_app/view/soccer_app_live_score_screen.dart';
import 'package:flutter_smttnbl_sports_app/view/soccer_app_main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SoccerAppMainScreen(),
    );
  }
}
