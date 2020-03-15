import 'package:dartz/dartz.dart';
import 'package:todo_bygaga/core/error/failures.dart';
import 'package:todo_bygaga/core/usecases/usecase.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';
import 'package:todo_bygaga/todo/domain/exceptions/TodoFailure.dart';
import 'package:todo_bygaga/todo/domain/repositories/todo_repository.dart';

class UpdateTodo extends UseCase<Todo, Params> {
  final TodoRepository repository;

  UpdateTodo(this.repository);

  @override
  Future<Either<Failure, Todo>> call(Params params) async {
    final todo = await repository.getOne(params.id);
    if (todo == null) {
      return Left(TodoFailure.message('Todo not found'));
    }
    return repository.save(params.todo);
  }
}

class Params {
  final String id;
  final Todo todo;

  Params({this.id, this.todo});
}
