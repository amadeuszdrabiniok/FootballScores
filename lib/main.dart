import 'package:flutter/material.dart';
import 'package:football_scores/screens/team_details_screen.dart';
import 'package:football_scores/screens/league_screen.dart';
import 'package:football_scores/screens/select_screen.dart';

void main() => runApp(FootballScore());

class FootballScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SelectScreen.id: (context) => SelectScreen(),
        LeagueScreen.id: (context) => LeagueScreen(),
        TeamDetailsScreen.id: (context) => TeamDetailsScreen(),
      },
      initialRoute: SelectScreen.id,
    );
  }
}
