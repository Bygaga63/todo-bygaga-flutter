import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todo_bygaga/todo/data/models/TaskModel.dart';
import 'package:todo_bygaga/todo/data/models/TodoModel.dart';
import 'package:todo_bygaga/todo/presentation/widgets/add_edit_task.dart';

class TaskList extends StatefulWidget {
  final TodoModel todo;

  TaskList({@required this.todo});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  Color _expansionColor = Color(0xFFB4B5B7);

  List<TaskModel> get _completedTasks =>
      widget.todo.tasks.where((task) => task.isComplete).toList();

  List<TaskModel> get _currentTasks =>
      widget.todo.tasks.where((task) => !task.isComplete).toList();

  double get _completedPercent =>
      _completedTasks.length / widget.todo.tasks.length;

  List<Widget> get _getCompletedComponents => _completedTasks
      .map((task) => ListTile(
            title: Text(task.description),
            leading: Icon(
              Icons.check_circle,
              color: widget.todo.color,
            ),
          ))
      .toList();

  void _onExpansionClick(bool expanding) => setState(() =>
      _expansionColor = expanding ? widget.todo.color : Color(0xFFB4B5B7));

  List<Widget> get _getCurrentComponents => _currentTasks
      .map((task) => ListTile(
            title: Text(task.description,
                style: TextStyle(
                  color: Color(0xFFB4B5B7),
                )),
            leading: CircularPercentIndicator(
              radius: 20.0,
              lineWidth: 2.5,
              percent: 1,
              progressColor: widget.todo.color,
            ),
            onTap: () => _updateClick(context, task),
          ))
      .toList();

  void _updateClick(BuildContext context, TaskModel task) {
    showModalBottomSheet(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: AddEditTask(
              todoColor: widget.todo.color,
              task: task,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: CircularPercentIndicator(
            radius: 30.0,
            lineWidth: 3.5,
            percent: _completedPercent,
            backgroundColor: Color(0xFF333436),
            progressColor: widget.todo.color,
          ),
          dense: true,
          title: Text(
            widget.todo.title,
            style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
              '${_completedTasks.length} of ${widget.todo.tasks.length} tasks'),
        ),
        Divider(thickness: 1.5),
        Column(
          children: _getCurrentComponents,
        ),
        ExpansionTile(
          title: Text(
            'Show completed (${_currentTasks.length})',
            style: TextStyle(color: _expansionColor),
          ),
          children: _getCompletedComponents,
          onExpansionChanged: _onExpansionClick,
        ),
      ],
    );
  }
}