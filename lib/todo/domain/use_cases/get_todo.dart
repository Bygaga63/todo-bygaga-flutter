import 'package:dartz/dartz.dart';
import 'package:todo_bygaga/core/error/failures.dart';
import 'package:todo_bygaga/core/usecases/usecase.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';
import 'package:todo_bygaga/todo/domain/repositories/todo_repository.dart';

class GetTodo implements UseCase<Todo, Params> {
  TodoRepository repository;

  GetTodo(this.repository);

  @override
  Future<Either<Failure, Todo>> call(Params params) {
    return repository.getOne(params.id);
  }
}

class Params {
  final String id;

  Params({this.id});
}
