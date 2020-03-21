import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todo_bygaga/todo/domain/entities/task.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';
import 'package:todo_bygaga/todo/presentation/widgets/add_edit_task.dart';

class TaskList extends StatefulWidget {
  final Todo todo;

  TaskList({@required this.todo});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  Color _expansionColor = Color(0xFFB4B5B7);

  List<Task> get _completedTasks =>
      widget.todo.tasks.where((task) => task.isComplete).toList();

  List<Task> get _activeTasks =>
      widget.todo.tasks.where((task) => !task.isComplete).toList();

  double get _completedPercent =>
      _completedTasks.length / widget.todo.tasks.length;

  List<Widget> get _completedTasksComponent => _completedTasks
      .map((task) => Column(
            children: <Widget>[
              ListTile(
                title: Text(task.description),
                leading: Icon(
                  Icons.check_circle,
                  color: Color(widget.todo.color),
                ),
              ),
              Divider(),
            ],
          ))
      .toList();

  void _onExpansionClick(bool expanding) {
    setState(() => _expansionColor =
        expanding ? Color(widget.todo.color) : Color(0xFFB4B5B7));
  }

  Widget _activeTasksComponent() => ListView.separated(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: _activeTasks.length ?? 0,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int index) {
        final task = _activeTasks[index];
        return ListTile(
          title: Text(task.description,
              style: TextStyle(
                color: Color(0xFFB4B5B7),
              )),
          leading: CircularPercentIndicator(
            radius: 20.0,
            lineWidth: 2.5,
            percent: 1,
            progressColor: Color(widget.todo.color),
          ),
          onTap: () => _updateClick(context, task),
        );
      });

  void _updateClick(BuildContext context, Task task) {
    showModalBottomSheet(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: AddEditTask(
              todoColor: Color(widget.todo.color),
              task: task,
            ),
          );
        });
  }

  Widget _closeButton(context) => ClipOval(
        child: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            color: Color(0xff8B8C8E),
            child: Icon(
              Icons.close,
              color: Colors.black,
              size: 20.0,
            ),
          ),
        ),
      );

  Widget _todoTitleComponent(context) => Column(
        children: <Widget>[
          ListTile(
            leading: CircularPercentIndicator(
              radius: 30.0,
              lineWidth: 3.5,
              percent: _completedPercent,
              backgroundColor: Color(0xFF333436),
              progressColor: Color(widget.todo.color),
            ),
            dense: true,
            title: Text(
              widget.todo.title,
              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
                '${_completedTasks.length} of ${widget.todo.tasks.length} tasks'),
            trailing: _closeButton(context),
          ),
          Divider(thickness: 1.5),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        _todoTitleComponent(context),
        _activeTasksComponent(),
        ExpansionTile(
          title: Text(
            'Show completed (${_activeTasks.length})',
            style: TextStyle(color: _expansionColor),
          ),
          children: _completedTasksComponent,
          onExpansionChanged: _onExpansionClick,
        ),
      ],
    ));
  }
}
