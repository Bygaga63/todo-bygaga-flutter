import 'package:todo_bygaga/core/error/failures.dart';

class TodoFailure extends Failure {
  TodoFailure.message(String text) : super.message(text);
}

class TodoNotFoundFailure extends TodoFailure {
  TodoNotFoundFailure() : super.message('Todo not found');
}
