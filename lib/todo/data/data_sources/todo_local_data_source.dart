import 'package:todo_bygaga/todo/data/models/task_model.dart';
import 'package:todo_bygaga/todo/data/models/todo_model.dart';
import 'package:todo_bygaga/todo/domain/exceptions/todo_exceptions.dart';
import 'package:uuid/uuid.dart';

abstract class TodoLocalDataSource {
  Future<TodoModel> getOne(String id) {}

  Future<void> remove(String id) {}

  Future<TodoModel> save(TodoModel todo) {}

  Future<List<TodoModel>> getList() {}

  Future<TodoModel> create(TodoModel todo) {}
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final List<TodoModel> _todos = [
    TodoModel(
      id: '1',
      title: 'Create flutter todo list',
      color: 0xFFA088F6,
      tasks: [
        TaskModel(id: '1', isComplete: false, description: 'Find desighn'),
        TaskModel(id: '2', isComplete: false, description: 'Create project'),
        TaskModel(
            id: '3',
            isComplete: true,
            description: 'Add clean arcitecture structure'),
        TaskModel(id: '4', isComplete: true, description: 'Create MVP')
      ],
    ),
    TodoModel(
      id: '2',
      title: 'Game App',
      color: 0xFFFFEB3B,
      tasks: [
        TaskModel(id: '1', isComplete: false, description: 'Dark theme'),
        TaskModel(id: '2', isComplete: false, description: 'Filters')
      ],
    ),
  ];
  @override
  Future<TodoModel> create(TodoModel todo) {
    String id = Uuid().v1();
    todo.copyWith(id: id);
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
    if (index == -1) {
      throw TodoNotFoundException();
    }
    _todos[index] = updatedTodo;
    return Future.value(updatedTodo);
  }
}
