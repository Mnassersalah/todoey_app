import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyapp/models/task_list_class.dart';
import 'package:todoeyapp/screens/tasks_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TasksListData(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TasksScreen(),
    );
  }
}
