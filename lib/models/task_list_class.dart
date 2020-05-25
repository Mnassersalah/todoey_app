import 'package:flutter/cupertino.dart';
import 'package:todoeyapp/models/task_class.dart';

class TasksListData extends ChangeNotifier {
  final List<Task> tasksList = [];
  int finishedCount = 0;

  int tasksCount() {
    return tasksList.length;
  }

  void toggleTaskIsDone(Task task) {
    task.toggleCheck();
    finishedCount = tasksList.where((task) => task.isDone).length;
    notifyListeners();
  }

  void addTask(Task newTask) {
    tasksList.add(newTask);
    notifyListeners();
  }

  void removeTask(Task task) {
    tasksList.remove(task);
    finishedCount = tasksList.where((task) => task.isDone).length;
    notifyListeners();
  }

  void editTask(int taskIndex, String newValue) {
    tasksList[taskIndex].name = newValue;
    notifyListeners();
  }
}
