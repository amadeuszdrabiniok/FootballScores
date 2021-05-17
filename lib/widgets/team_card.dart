import 'package:flutter/material.dart';
import 'package:football_scores/widgets/football_card.dart';

class TeamCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Function onPressed;

  TeamCard({@required this.title, this.imageUrl, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: FootballCard(
        child: Row(
          children: [
            Expanded(
              child: Image.network(
                imageUrl,
                width: 100.0,
                height: 100.0,
              ),
            ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
      onTap: onPressed,
    );
  }
}
