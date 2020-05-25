import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyapp/components/TaskTile.dart';
import 'package:todoeyapp/models/task_class.dart';
import 'package:todoeyapp/models/task_list_class.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksListData>(
      builder: (context, tasksData, child) {
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: tasksData.tasksList.length,
          itemBuilder: (context, index) {
            final Task task = tasksData.tasksList[index];
            return Provider<int>(
              create: (context) => index,
              child: TaskTile(
                task: task,
                onDonePressed: (bool checkValue) {
                  tasksData.toggleTaskIsDone(task);
                },
                onDeletePressed: () {
                  tasksData.removeTask(task);
                },
              ),
            );
          },
        );
      },
    );
  }
}
