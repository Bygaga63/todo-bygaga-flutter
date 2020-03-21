import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bygaga/injection_container.dart';
import 'package:todo_bygaga/todo/presentation/manager/todos_bloc.dart';
import 'package:todo_bygaga/todo/presentation/manager/todos_event.dart';
import 'package:todo_bygaga/todo/presentation/pages/todo.dart';
import 'package:todo_bygaga/todo/presentation/pages/todo_list.dart';
import 'package:todo_bygaga/todo/presentation/pages/todo_scroll.dart';

import 'core/routes.dart';
import 'injection_container.dart' as di;

void main() async {
//  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  return runApp(BlocProvider<TodosBloc>(
      create: (_) {
        return sl<TodosBloc>()..add(GetTodosEvent());
      },
      child: MyApp()));
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

      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }

        if (pathElements[1] == 'todo') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (_) => TodosScrollPage(todoIndex: index),
          );
        }
        return null;
      },
//      initialRoute: Routes.todo,
    );
  }
}
