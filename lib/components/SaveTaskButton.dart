import 'package:flutter/material.dart';

class SaveTaskButton extends StatelessWidget {
  final Function onPressed;
  final String label;

  SaveTaskButton({this.onPressed, this.label});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.lightBlueAccent,
      padding: EdgeInsets.all(15.0),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
