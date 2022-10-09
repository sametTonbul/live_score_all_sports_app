import 'dart:convert';

import 'package:flutter_smttnbl_sports_app/models/soccer_models.dart';
import 'package:http/http.dart' as http;

class SoccerApi {
  Future<List<SoccerMatch>?> getAllMatches() async {
    var client = http.Client();
    var apiUrl =
        Uri.parse('https://v3.football.api-sports.io/fixtures?live=all');
    var response = await client.get(apiUrl, headers: {
      'x-rapidapi-host': "v3.football.api-sports.io",
      'x-rapidapi-key': '3132435e1692bec56d0611fbaee06471'
    });
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      List<dynamic> matchesList = body['response'];
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();
      return matches;
    }
    return null;
  }
}

  // static final headers = {
  //   'x-rapidapi-host': "v3.football.api-sports.io",
  //   'x-rapidapi-key': 'a68c6df5dfa4105431e5df6fbcba1c7c',
  // };

  // Future<List<SoccerMatch>?> getAllMatches() async {
  //   Response res = await get(Uri.parse(apiUrl), headers: headers);
  //   // ignore: prefer_typing_uninitialized_variables
  //   var body;

  //   if (res.statusCode == 200) {
  //     body = jsonDecode(res.body);
  //     List<dynamic> matchesList = body['response'];
  //     List<SoccerMatch> matches = matchesList
  //         .map((dynamic item) => SoccerMatch.fromJson(item))
  //         .toList();
  //     return matches;
  //   }
  // }

