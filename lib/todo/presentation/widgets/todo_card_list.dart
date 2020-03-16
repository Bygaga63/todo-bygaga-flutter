import 'package:flutter/material.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';
import 'package:todo_bygaga/todo/presentation/widgets/add_card.dart';
import 'package:todo_bygaga/todo/presentation/widgets/todo_card.dart';

class TodoCardList extends StatelessWidget {
  final List<Todo> todos;

  TodoCardList({@required this.todos});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: todos.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return AddCard();
          }

          return TodoCard(
            todo: todos[index - 1],
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        padding: EdgeInsets.all(10.0),
      ),
    );
  }
}
