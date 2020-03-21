import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:todo_bygaga/core/styles/colors.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';
import 'package:todo_bygaga/todo/presentation/manager/bloc.dart';
import 'package:todo_bygaga/todo/presentation/widgets/add_edit_task.dart';
import 'package:todo_bygaga/todo/presentation/widgets/task_list.dart';

class TodosScrollPage extends StatefulWidget {
  @override
  _TodosScrollPageState createState() => _TodosScrollPageState();
}

class _TodosScrollPageState extends State<TodosScrollPage> {
  PageController _pageController;
  int _pageIndex = 0;
  @override
  void initState() {
    FlutterStatusbarcolor.setStatusBarColor(AppColors.todoListBackgroundColor);
    _pageController =
        PageController(viewportFraction: 0.95, initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _todosComponent(List<Todo> todoList) => SafeArea(
        bottom: false,
        child: PageView.builder(
          onPageChanged: (int newIndex) =>
              setState(() => _pageIndex = newIndex),
          controller: _pageController,
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            final todo = todoList[index];
            return Padding(
              padding: const EdgeInsets.only(
                left: 2.0,
                right: 2.0,
                top: 20.0,
              ),
              child: Container(
//                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0)),
                    color: AppColors.todoBackgroundColor,
                  ),
                  child: TaskList(todo: todo)),
            );
          },
        ),
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
      extendBody: true,
      backgroundColor: AppColors.todoListBackgroundColor,
      body: BlocBuilder<TodosBloc, TodosState>(
        builder: (BuildContext context, TodosState state) {
          if (state is TodosLoaded) {
            return _todosComponent(state.todos);
          }

          return Container();
        },
      ),
      floatingActionButton: BlocBuilder<TodosBloc, TodosState>(
        builder: (BuildContext context, TodosState state) {
          if (state is TodosLoaded) {
            return FloatingActionButton(
                onPressed: () {
                  _addClick(context, state.todos[_pageIndex]);
                },
                tooltip: 'Add',
                backgroundColor: Color(state.todos[_pageIndex].color),
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
