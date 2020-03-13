import 'package:todo_bygaga/core/error/failures.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';

class TodoValidator {
  final Todo todo;
  List<Failure> _failures = [];

  TodoValidator(this.todo);

  void _checkTitle() {
    (todo.title == null || todo.title.isEmpty) ??
        _failures.add(TodoFailure.message('Please, fill title'));
  }

  void _checkTasks() {
    (todo.tasks == null) ??
        _failures.add(TodoFailure.message('Todo should not be null'));
  }

  void _checkId() {
    !(todo.id is String) ??
        _failures.add(TodoFailure.message('Id, should be string'));
  }

  Failure validateCreate() {
    _checkTitle();
    _checkTasks();

    if (_failures.length > 0) {
      return _failures[0];
    }
  }
}
