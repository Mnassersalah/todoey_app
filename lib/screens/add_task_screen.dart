import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyapp/components/EditTaskScreenTitle.dart';
import 'package:todoeyapp/components/SaveTaskButton.dart';
import 'package:todoeyapp/components/TaskTextField.dart';
import 'package:todoeyapp/models/task_class.dart';
import 'package:todoeyapp/models/task_list_class.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newValue = 'New Task';

    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(20.0), topEnd: Radius.circular(20.0))),
        padding: EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            EditTaskScreenTitle('Add Task'),
            SizedBox(height: 20.0),
            TaskTextField(
              onChanged: (value) {
                newValue = value;
              },
            ),
            SizedBox(height: 20.0),
            SaveTaskButton(
              label: 'ADD',
              onPressed: () {
                Provider.of<TasksListData>(context, listen: false).addTask(Task(name: newValue));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
