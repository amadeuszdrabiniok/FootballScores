import 'package:flutter/material.dart';

class GoButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  GoButton({@required this.label, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        backgroundColor: Colors.black,
        padding: EdgeInsets.all(10.0),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
