import 'package:dartz/dartz.dart';
import 'package:todo_bygaga/core/error/failures.dart';
import 'package:todo_bygaga/core/usecases/usecase.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';
import 'package:todo_bygaga/todo/domain/repositories/todo_repository.dart';

class GetTodoList extends UseCase<List<Todo>, NoParams> {
  final TodoRepository repository;
  GetTodoList(this.repository);

  @override
  Future<Either<Failure, List<Todo>>> call(NoParams params) {
    return repository.getList();
  }
}
