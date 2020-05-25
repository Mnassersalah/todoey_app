import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyapp/components/EditTaskScreenTitle.dart';
import 'package:todoeyapp/components/SaveTaskButton.dart';
import 'package:todoeyapp/components/TaskTextField.dart';
import 'package:todoeyapp/models/task_list_class.dart';

class EditTaskScreen extends StatelessWidget {
  final int taskIndex;
  EditTaskScreen(this.taskIndex);

  @override
  Widget build(BuildContext context) {
    String taskName = Provider.of<TasksListData>(context).tasksList[taskIndex].name;

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
            EditTaskScreenTitle('Edit Task'),
            SizedBox(height: 20.0),
            TaskTextField(
              value: taskName,
              onChanged: (newValue) {
                taskName = newValue;
              },
            ),
            SizedBox(height: 20.0),
            SaveTaskButton(
              label: 'Edit',
              onPressed: () {
                Provider.of<TasksListData>(context, listen: false).editTask(taskIndex, taskName);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
