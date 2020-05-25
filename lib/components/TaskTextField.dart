import 'package:flutter/material.dart';

class TaskTextField extends StatelessWidget {
  final Function(String) onChanged;
  final String value;
  TaskTextField({this.value = "", this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      autofocus: true,
      style: TextStyle(fontSize: 20.0),
      cursorColor: Colors.lightBlueAccent,
      decoration: InputDecoration(
        hintText: 'Task Name',
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.5)),
      ),
      onChanged: onChanged,
    );
  }
}
