import 'package:flutter/material.dart';
import 'package:todo_bygaga/todo/domain/entities/task.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';
import 'package:todo_bygaga/todo/presentation/pages/todo.dart';
import 'package:todo_bygaga/todo/presentation/pages/todo_list.dart';

import 'core/routes.dart';

final TEMP_DATA = [
  Todo(
    id: '1',
    title: 'Create flutter todo list',
    color: 0xFFA088F6,
    tasks: [
      Task(id: '1', isComplete: false, description: 'Find desighn'),
      Task(id: '2', isComplete: false, description: 'Create project'),
      Task(
          id: '3',
          isComplete: true,
          description: 'Add clean arcitecture structure'),
      Task(id: '4', isComplete: true, description: 'Create MVP')
    ],
  ),
  Todo(
    id: '2',
    title: 'Game App',
    color: 0xFFFFEB3B,
    tasks: [
      Task(id: '1', isComplete: false, description: 'Dark theme'),
      Task(id: '2', isComplete: false, description: 'Filters')
    ],
  ),
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
//  final TodoModel todo = TodoRepositoryImpl().getList()[0];
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
        Routes.todo: (_) => TodoPage(todo: TEMP_DATA[0]),
      },
//      initialRoute: Routes.todo,
    );
  }
}
