import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todo_bygaga/todo/data/models/TaskModel.dart';
import 'package:todo_bygaga/todo/data/models/TodoModel.dart';

class TaskList extends StatelessWidget {
  final TodoModel todo;

  TaskList({@required this.todo});

  List<TaskModel> get _getCompletedTasks =>
      todo.tasks.where((task) => task.isComplete).toList();
  List<TaskModel> get _getInProcessTasks =>
      todo.tasks.where((task) => !task.isComplete).toList();

  List<Widget> get _getCompletedComponents => _getCompletedTasks
      .map((task) => ListTile(
            title: Text(task.description),
            leading: CircularPercentIndicator(
              radius: 20.0,
              lineWidth: 3.0,
              percent: 0.8,
              backgroundColor: Colors.grey,
              progressColor: Colors.blue,
            ),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: CircularPercentIndicator(
            radius: 30.0,
            lineWidth: 3.0,
            percent: 0.8,
            backgroundColor: Colors.grey,
            progressColor: Colors.blue,
          ),
          dense: true,
          title: Text(
            todo.title,
            style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
              '${_getCompletedTasks.length} of ${todo.tasks.length} tasks'),
        ),
        Divider(thickness: 1.5),
        ListView.separated(
          shrinkWrap: true,
          itemCount: _getInProcessTasks.length,
          itemBuilder: (BuildContext context, int index) {
            final task = _getInProcessTasks[index];
            return ListTile(
              title: Text(task.description),
              leading: CircularPercentIndicator(
                radius: 20.0,
                lineWidth: 3.0,
                percent: 0.8,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
//                  subtitle: ,
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              Divider(thickness: 1.5),
        ),
        Divider(thickness: 1.5),
        ExpansionTile(
          title: Text('Show completed (${_getInProcessTasks.length})'),
          children: _getCompletedComponents,
        ),
      ],
    );
  }
}
