import 'package:flutter/material.dart';
import 'package:todo_bygaga/common/routes.dart';
import 'package:todo_bygaga/todo/presentation/pages/todo.dart';
import 'package:todo_bygaga/todo/presentation/pages/todo_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        Routes.todo: (_) => TodoPage(),
      },
      initialRoute: Routes.todo,
    );
  }
}
