import 'package:dartz/dartz.dart';
import 'package:todo_bygaga/core/error/failures.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';
import 'package:todo_bygaga/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
//  @override
//  List<TodoModel> getList() {
//    return
//  }

  @override
  Future<Either<Failure, Todo>> getOne(String id) {}

  @override
  Future<Either<Failure, void>> remove(String id) {}

  @override
  Future<Either<Failure, Todo>> save(Todo todo) {}

  @override
  Future<Either<Failure, List<Todo>>> getList() {}

  @override
  Future<Either<Failure, Todo>> create(Todo todo) {}
}
