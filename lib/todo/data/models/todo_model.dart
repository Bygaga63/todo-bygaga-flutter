import 'package:todo_bygaga/todo/data/models/task_model.dart';

class TodoModel {
  String id;
  final String title;
  final List<TaskModel> tasks;
  final int color;

  TodoModel({
    this.id,
    this.title,
    this.tasks,
    this.color,
  });
}
