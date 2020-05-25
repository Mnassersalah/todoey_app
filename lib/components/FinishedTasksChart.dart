import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyapp/models/task_list_class.dart';

class FinishedTasksChart extends StatelessWidget {
  PieChart backgroundPieChart() {
    List<PieChartSectionData> sections = [];
    for (int i = 0; i < 16; i++) {
      sections.add(PieChartSectionData(
        value: 1,
        title: '',
        radius: 35,
        color: Colors.lightBlueAccent.shade100,
      ));
    }
    return PieChart(
      PieChartData(
        centerSpaceRadius: 30,
        startDegreeOffset: 270.0,
        sectionsSpace: 3,
        borderData: FlBorderData(show: false),
        sections: sections,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(height: 140.0, width: 140.0), // adjust the height here
        child: Consumer<TasksListData>(builder: (context, tasksListData, child) {
          int allTasks = tasksListData.tasksList.length == 0 ? 1 : tasksListData.tasksList.length;
          double finishedTasks = tasksListData.finishedCount.toDouble();
          double unfinishedTasks = allTasks - tasksListData.finishedCount.toDouble();
          int finishedPercent = (finishedTasks / (allTasks) * 100).round();

          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
//              CircleAvatar(
////                backgroundColor: Colors.transparent,
////                radius: 65,
////              ),
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.lightBlueAccent.shade100,
                      blurRadius: 10.0,
                      spreadRadius: 3.0,
                    ),
                  ],
                ),
              ),
              backgroundPieChart(),
              PieChart(
                PieChartData(
                  centerSpaceRadius: 30,
                  startDegreeOffset: 270.0,
                  borderData: FlBorderData(show: false),
                  sections: [
                    PieChartSectionData(
                      value: finishedTasks,
                      title: '$finishedPercent %',
                      titlePositionPercentageOffset: -(30 / 35),
                      radius: 35,
                      color: Colors.white.withOpacity(.8),
                    ),
                    PieChartSectionData(
                      value: unfinishedTasks,
                      title: '',
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

PieChartSectionData defaultPieChartSectionData({double value = 0, Color color}) {
  return PieChartSectionData(
    color: color,
    radius: 35,
    value: value,
  );
}
