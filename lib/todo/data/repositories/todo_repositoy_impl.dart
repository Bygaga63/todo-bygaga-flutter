import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:todo_bygaga/core/error/failures.dart';
import 'package:todo_bygaga/todo/data/data_sources/todo_local_data_source.dart';
import 'package:todo_bygaga/todo/data/models/todo_model.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';
import 'package:todo_bygaga/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  final TodoLocalDataSource localDataSource;

  TodoRepositoryImpl({@required this.localDataSource});

  @override
  Future<Either<Failure, Todo>> getOne(String id) {}

  @override
  Future<Either<Failure, void>> remove(String id) {}

  @override
  Future<Either<Failure, Todo>> save(Todo todo) {}

  @override
  Future<Either<Failure, List<Todo>>> getList() async {
    List<TodoModel> todosModals = await localDataSource.getList();
    final result = todosModals.map(TodoModel.toTodo).toList();
    return Right(result);
  }

  @override
  Future<Either<Failure, Todo>> create(Todo todo) async {
    final createCandidate = TodoModel.fromTodo(todo);
    final result = await localDataSource.create(createCandidate);
    return Right(TodoModel.toTodo(result));
  }
}
