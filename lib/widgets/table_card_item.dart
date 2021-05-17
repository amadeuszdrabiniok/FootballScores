import 'package:flutter/material.dart';

class TableCardItem extends StatelessWidget {
  final String label;
  final String value;

  TableCardItem(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
        Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}
