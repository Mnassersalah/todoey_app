import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyapp/models/task_class.dart';
import 'package:todoeyapp/screens/edit_task_screen.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function() onDeletePressed;
  final Function(bool) onDonePressed;

  TaskTile({this.task, this.onDonePressed, this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    int taskIndex = Provider.of<int>(context);
    return ListTile(
      contentPadding: EdgeInsets.only(
        left: 16.0,
      ),
      title: RawMaterialButton(
        onLongPress: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                    child: Container(
                  padding: EdgeInsetsDirectional.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: EditTaskScreen(taskIndex),
                ));
              });
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            task.name,
            textAlign: TextAlign.left,
            style: TextStyle(
              decoration: task.isDone ? TextDecoration.lineThrough : null,
              color: task.isDone ? Colors.lightBlueAccent : Colors.black,
            ),
          ),
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: task.isDone,
            onChanged: onDonePressed,
          ),
          //delete button----------------
          IconButton(
            onPressed: onDeletePressed,
            icon: Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}
