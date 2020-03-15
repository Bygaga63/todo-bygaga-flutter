import 'package:get_it/get_it.dart';
import 'package:todo_bygaga/todo/data/data_sources/todo_local_data_source.dart';
import 'package:todo_bygaga/todo/data/repositories/todo_repositoy_impl.dart';
import 'package:todo_bygaga/todo/domain/repositories/todo_repository.dart';
import 'package:todo_bygaga/todo/domain/use_cases/get_todo.dart';
import 'package:todo_bygaga/todo/domain/use_cases/get_todo_list.dart';
import 'package:todo_bygaga/todo/domain/use_cases/remove_todo.dart';
import 'package:todo_bygaga/todo/domain/use_cases/update_todo.dart';
import 'package:todo_bygaga/todo/presentation/manager/todos_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => TodosBloc(
      todo: sl(),
      todoList: sl(),
      remove: sl(),
      update: sl(),
    ),
  );

  sl.registerLazySingleton(() => GetTodo(sl()));
  sl.registerLazySingleton(() => UpdateTodo(sl()));
  sl.registerLazySingleton(() => RemoveTodo(sl()));
  sl.registerLazySingleton(() => GetTodoList(sl()));

  // Repository
  sl.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<TodoLocalDataSource>(
    () => TodoLocalDataSourceImpl(),
  );
}
