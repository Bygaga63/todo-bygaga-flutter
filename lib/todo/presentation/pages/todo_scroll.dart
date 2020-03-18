import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bygaga/core/styles/colors.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';
import 'package:todo_bygaga/todo/presentation/manager/bloc.dart';
import 'package:todo_bygaga/todo/presentation/widgets/add_edit_task.dart';
import 'package:todo_bygaga/todo/presentation/widgets/task_list.dart';

class TodosScrollPage extends StatelessWidget {
  Widget _todosContent(List<Todo> todoList) => PageView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          final todo = todoList[index];
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 5.0, right: 5.0, bottom: 0, top: 20.0),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0)),
                    color: AppColors.todoBackgroundColor,
                  ),
                  child: TaskList(todo: todo)),
            ),
          );
        },
      );

  void _addClick(BuildContext context, Todo todo) {
    showModalBottomSheet(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: AddEditTask(
              todoColor: Color(todo.color),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.todoListBackgroundColor,
      body: BlocBuilder<TodosBloc, TodosState>(
        builder: (BuildContext context, TodosState state) {
          if (state is TodosLoaded) {
            return _todosContent(state.todos);
          }

          return Container();
        },
      ),
      floatingActionButton: BlocBuilder<TodosBloc, TodosState>(
        builder: (BuildContext context, TodosState state) {
          if (state is TodosLoaded) {
            return FloatingActionButton(
                onPressed: () {
                  _addClick(context, state.todos[0]);
                },
                tooltip: 'Add',
                backgroundColor: Color(state.todos[0].color),
                child: Icon(
                  Icons.add,
                ));
          }

          return Container();
        },
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
