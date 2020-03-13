import 'package:dartz/dartz.dart';
import 'package:todo_bygaga/core/error/failures.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<Todo>>> getList();
  Future<Either<Failure, Todo>> getOne(String id);
  Future<Either<Failure, void>> update(String id);
  Future<Either<Failure, void>> remove(String id);
  Future<Either<Failure, Todo>> create(Todo todo);
}
