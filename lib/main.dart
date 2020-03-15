import 'package:flutter/material.dart';
import 'package:todo_bygaga/todo/presentation/pages/todo.dart';
import 'package:todo_bygaga/todo/presentation/pages/todo_list.dart';

import 'core/routes.dart';
import 'injection_container.dart' as di;

void main() async {
//  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
//      initialRoute: Routes.todo,
    );
  }
}
