import 'package:flutter/material.dart';
import 'package:todo_bygaga/todo/data/models/TodoModel.dart';
import 'package:todo_bygaga/todo/data/repositories/todo_repositoy_impl.dart';
import 'package:todo_bygaga/todo/presentation/widgets/add_task.dart';
import 'package:todo_bygaga/todo/presentation/widgets/task_list.dart';

class TodoPage extends StatelessWidget {
  final TodoModel todo = TodoRepositoryImpl().getList()[0];

  void _addClick(BuildContext context) {
    showModalBottomSheet(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: AddTask(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TaskList(
          todo: todo,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addClick(context);
        },
        tooltip: 'Add',
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Container(
          height: 70.0,
        ),
      ),
    );
  }
}
