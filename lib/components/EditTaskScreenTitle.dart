import 'package:flutter/material.dart';

class EditTaskScreenTitle extends StatelessWidget {
  final String title;
  EditTaskScreenTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 28,
        color: Colors.lightBlueAccent,
      ),
    );
  }
}
