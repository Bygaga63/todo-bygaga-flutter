import 'package:dartz/dartz.dart';
import 'package:todo_bygaga/core/error/failures.dart';
import 'package:todo_bygaga/core/usecases/usecase.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';
import 'package:todo_bygaga/todo/domain/repositories/todo_repository.dart';
import 'package:todo_bygaga/todo/domain/validator/todo_validator.dart';

class CreateTodo extends UseCase<Todo, Params> {
  final TodoRepository todoRepository;

  CreateTodo(this.todoRepository);

  @override
  Future<Either<Failure, Todo>> call(Params params) {
    var validateCreate = TodoValidator(params.todo).validateCreate();
    if (validateCreate != null) {
//      return Left(validateCreate);
    }
    return todoRepository.create(params.todo);
  }
}

class Params extends Todo {
  final Todo todo;

  Params({
    this.todo,
  });
}
