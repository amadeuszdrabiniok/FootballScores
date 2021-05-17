import 'package:flutter/material.dart';
import 'package:football_scores/screens/team_details_screen.dart';
import 'package:football_scores/services/football_data.dart';
import 'package:football_scores/services/result_arguments.dart';
import 'package:football_scores/widgets/football_app_bar.dart';
import 'package:football_scores/widgets/team_card.dart';

class LeagueScreen extends StatefulWidget {
  static const String id = 'league_screen';

  @override
  _LeagueScreenState createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  @override
  Widget build(BuildContext context) {
    final ResultArguments arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: FootballAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TeamCard(
                title: arguments.teamsData['response'][index]['team']['name'],
                imageUrl: arguments.teamsData['response'][index]['team']
                    ['logo'],
                onPressed: () async {
                  var teamDetails = await FootballData().getTeamDetails(
                      arguments.teamsData['response'][index]['team']['id']
                          .toString(),
                      arguments.teamsData['parameters']['league']);

                  Navigator.pushNamed(
                    context,
                    TeamDetailsScreen.id,
                    arguments: ResultArguments(
                      teamDetails: teamDetails,
                    ),
                  );
                },
              );
            },
            itemCount: arguments.teamsData['results'],
          ),
        ),
      ),
    );
  }
}
