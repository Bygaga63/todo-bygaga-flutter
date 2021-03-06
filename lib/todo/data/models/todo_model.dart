import 'package:todo_bygaga/todo/data/models/task_model.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';

class TodoModel extends Todo {
  final String id;
  final String title;
  final List<TaskModel> tasks;
  final int color;

  TodoModel({
    this.id,
    this.title,
    this.tasks,
    this.color,
  });

  factory TodoModel.fromTodo(Todo todo) => TodoModel(
        id: todo.id,
        title: todo.title,
        color: todo.color,
        tasks: todo.tasks,
      );

  static Todo toTodo(TodoModel todoModel) => Todo(
        id: todoModel.id,
        title: todoModel.title,
        color: todoModel.color,
        tasks: todoModel.tasks.map(TaskModel.toTask).toList(),
      );
}
