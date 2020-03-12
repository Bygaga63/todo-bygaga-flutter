import 'package:flutter/material.dart';
import 'package:todo_bygaga/todo/data/models/TodoModel.dart';
import 'package:todo_bygaga/todo/data/repositories/todo_repositoy_impl.dart';
import 'package:todo_bygaga/todo/presentation/pages/todo.dart';
import 'package:todo_bygaga/todo/presentation/pages/todo_list.dart';

import 'core/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final TodoModel todo = TodoRepositoryImpl().getList()[0];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        Routes.todoList: (_) => TodoListPage(),
        Routes.todo: (_) => TodoPage(todo: todo),
      },
//      initialRoute: Routes.todo,
    );
  }
}
