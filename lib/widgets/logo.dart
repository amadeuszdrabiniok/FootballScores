import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.sports_soccer,
            size: 45.0,
          ),
          Text(
            'Football Scores',
            style: TextStyle(fontSize: 45.0),
          ),
        ],
      ),
    );
  }
}
