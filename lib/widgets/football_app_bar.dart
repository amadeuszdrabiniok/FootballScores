import 'package:flutter/material.dart';

class FootballAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Row(
        children: [
          Icon(
            Icons.sports_soccer,
            size: 30.0,
          ),
          Text(
            'Football Scores',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
