import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:todo_bygaga/core/styles/colors.dart';
import 'package:todo_bygaga/todo/data/models/TodoModel.dart';
import 'package:todo_bygaga/todo/presentation/widgets/add_edit_task.dart';
import 'package:todo_bygaga/todo/presentation/widgets/task_list.dart';

class TodoPage extends StatefulWidget {
  final TodoModel todo;

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
              todoColor: widget.todo.color,
            ),
          );
        });
  }

  Widget _closeButton(context) => ClipOval(
        child: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            padding: EdgeInsets.all(1.0),
            color: Color(0xFFF4F4F4),
            child: Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.todoBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            TaskList(
              todo: widget.todo,
            ),
            Positioned(
              child: this._closeButton(context),
              right: 5.0,
              top: 5.0,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addClick(context);
        },
        tooltip: 'Add',
        backgroundColor: widget.todo.color,
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
