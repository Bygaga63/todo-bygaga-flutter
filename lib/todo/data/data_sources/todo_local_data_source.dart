import 'package:todo_bygaga/todo/data/exceptions/todo_exceptions.dart';
import 'package:todo_bygaga/todo/data/models/todo_model.dart';
import 'package:uuid/uuid.dart';

abstract class TodoLocalDataSource {
  Future<TodoModel> getOne(String id) {}

  Future<void> remove(String id) {}

  Future<TodoModel> save(TodoModel todo) {}

  Future<List<TodoModel>> getList() {}

  Future<TodoModel> create(TodoModel todo) {}
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final List<TodoModel> _todos = [];
  @override
  Future<TodoModel> create(TodoModel todo) {
    String id = Uuid().v1();
    todo.id = id;
    _todos.add(todo);
    return Future.value(todo);
  }

  @override
  Future<List<TodoModel>> getList() {
    return Future.value(_todos);
  }

  @override
  Future<TodoModel> getOne(String id) {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    return Future.value(todo);
  }

  @override
  Future<void> remove(String id) async {
    final todo = getOne(id);
    if (todo == null) {
      throw TodoNotFoundException();
    }
    _todos.removeWhere((todo) => todo.id == id);
  }

  @override
  Future<TodoModel> save(TodoModel updatedTodo) {
    final index = _todos.indexWhere((todo) => todo.id == updatedTodo.id);
    _todos[index] = updatedTodo;
    return Future.value(updatedTodo);
  }
}
