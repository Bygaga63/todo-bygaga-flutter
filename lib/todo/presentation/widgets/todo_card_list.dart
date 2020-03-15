import 'package:flutter/material.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';
import 'package:todo_bygaga/todo/presentation/widgets/todo_card.dart';

class TodoCardList extends StatelessWidget {
  final List<Todo> todos;

  TodoCardList({@required this.todos});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        padding: EdgeInsets.all(10.0),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        crossAxisCount: 2,
        children: <Widget>[
          TodoCard(
            isCreateCard: true,
          ),
          TodoCard(
            isCreateCard: false,
            todo: todos[0],
          ),
          TodoCard(
            isCreateCard: false,
            todo: todos[1],
          ),
        ],
      ),
    );
  }
}
