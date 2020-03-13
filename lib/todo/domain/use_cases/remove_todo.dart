import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:todo_bygaga/core/error/failures.dart';
import 'package:todo_bygaga/core/usecases/usecase.dart';
import 'package:todo_bygaga/todo/domain/repositories/todo_repository.dart';

class RemoveTodo extends UseCase<void, Params> {
  final TodoRepository repository;

  RemoveTodo(this.repository);

  @override
  Future<Either<Failure, void>> call(Params params) {
    return repository.remove(params.id);
  }
}

class Params {
  final String id;

  Params({@required this.id});
}
