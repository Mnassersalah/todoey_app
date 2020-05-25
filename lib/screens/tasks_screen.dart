import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoeyapp/components/FinishedTasksChart.dart';
import 'package:todoeyapp/screens/add_task_screen.dart';
import 'package:todoeyapp/components/TaskList.dart';
import 'package:todoeyapp/models/task_list_class.dart';
import 'package:provider/provider.dart';
//import 'package:fl_chart/fl_chart.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                    child: Container(
                  padding: EdgeInsetsDirectional.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen(),
                ));
              });
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 60, bottom: 30.0, right: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.list,
                        color: Colors.lightBlueAccent,
                        size: 48,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                      //width: double.infinity,
                    ),
                    Text(
                      'Todoey',
                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      '${Provider.of<TasksListData>(context).tasksCount()} Tasks, ${Provider.of<TasksListData>(context).finishedCount} finished',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
                FinishedTasksChart(),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadiusDirectional.only(topStart: Radius.circular(20), topEnd: Radius.circular(20))),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}

//
//void onChanged(bool newValue) {
//  setState(() {
//    isChecked = newValue;
//  });
//}
