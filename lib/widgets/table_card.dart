import 'package:flutter/material.dart';
import 'package:football_scores/widgets/football_card.dart';
import 'package:football_scores/widgets/table_card_item.dart';

class TableCard extends StatelessWidget {
  final List<TableCardItem> tableCardItems;
  final String title;
  TableCard({this.tableCardItems, this.title});

  @override
  Widget build(BuildContext context) {
    return FootballCard(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Divider(
            thickness: 2.0,
            color: Colors.black,
          ),
          Column(
            children: tableCardItems,
          ),
        ],
      ),
    );
  }
}
