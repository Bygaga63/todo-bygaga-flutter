import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:todo_bygaga/core/styles/colors.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';
import 'package:todo_bygaga/todo/presentation/widgets/add_edit_task.dart';
import 'package:todo_bygaga/todo/presentation/widgets/task_list.dart';

class TodoPage extends StatefulWidget {
  final Todo todo;

  TodoPage({this.todo}) {
    FlutterStatusbarcolor.setStatusBarColor(AppColors.todoBackgroundColor);
  }

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  void _addClick(BuildContext context) {
    showModalBottomSheet(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: AddEditTask(
              todoColor: Color(widget.todo.color),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.todoBackgroundColor,
      body: TaskList(todo: widget.todo),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addClick(context);
        },
        tooltip: 'Add',
        backgroundColor: Color(widget.todo.color),
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF2D2E30),
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Container(
          height: 70.0,
        ),
      ),
    );
  }
}
