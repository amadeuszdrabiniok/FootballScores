import 'package:flutter/material.dart';
import 'package:football_scores/services/result_arguments.dart';
import 'package:football_scores/widgets/football_app_bar.dart';
import 'package:football_scores/widgets/football_card.dart';
import 'package:football_scores/widgets/table_card.dart';
import 'package:football_scores/widgets/table_card_item.dart';

class TeamDetailsScreen extends StatelessWidget {
  static const String id = 'team_details_screen';

  TableCard teamStatisticsTable(var teamDetails) {
    List<TableCardItem> cardItems = [];

    cardItems.add(TableCardItem('Played:',
        teamDetails['response']['fixtures']['played']['total'].toString()));
    cardItems.add(TableCardItem('Wins:',
        teamDetails['response']['fixtures']['wins']['total'].toString()));
    cardItems.add(TableCardItem('Draws:',
        teamDetails['response']['fixtures']['draws']['total'].toString()));
    cardItems.add(TableCardItem('Loses:',
        teamDetails['response']['fixtures']['loses']['total'].toString()));

    return TableCard(
      tableCardItems: cardItems,
      title: 'Statistics',
    );
  }

  TableCard teamGoalsTable(var teamDetails) {
    List<TableCardItem> cardItems = [];

    cardItems.add(TableCardItem('Goals for:',
        teamDetails['response']['goals']['for']['total']['total'].toString()));
    cardItems.add(TableCardItem(
        'Avg/match for:',
        teamDetails['response']['goals']['for']['average']['total']
            .toString()));
    cardItems.add(TableCardItem(
        'Goals against:',
        teamDetails['response']['goals']['against']['total']['total']
            .toString()));
    cardItems.add(TableCardItem(
        'Avg/match against:',
        teamDetails['response']['goals']['against']['average']['total']
            .toString()));

    return TableCard(
      tableCardItems: cardItems,
      title: 'Goals',
    );
  }

  @override
  Widget build(BuildContext context) {
    final ResultArguments arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: FootballAppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FootballCard(
              child: Text(
                arguments.teamDetails['response']['team']['name'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            teamStatisticsTable(arguments.teamDetails),
            teamGoalsTable(arguments.teamDetails),
          ],
        ),
      ),
    );
  }
}
