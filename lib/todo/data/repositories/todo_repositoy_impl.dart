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
  Future<Either<Failure, Function>> remove(String id) {}

  @override
  Future<Either<Failure, Function>> update(String id) {}

  @override
  Future<Either<Failure, List<Todo>>> getList() {}
}
