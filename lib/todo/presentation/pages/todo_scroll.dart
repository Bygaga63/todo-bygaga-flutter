import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bygaga/core/styles/colors.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';
import 'package:todo_bygaga/todo/presentation/manager/bloc.dart';
import 'package:todo_bygaga/todo/presentation/widgets/task_list.dart';

class TodosScrollPage extends StatelessWidget {
  Widget _todosContent(List<Todo> todoList) => PageView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          final todo = todoList[index];
          return TaskList(todo: todo);
        },
      );

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
        ));
  }
}
