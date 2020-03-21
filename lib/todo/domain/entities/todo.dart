import 'package:equatable/equatable.dart';
import 'package:todo_bygaga/todo/domain/entities/task.dart';

class Todo extends Equatable {
  final String id;
  final String title;
  final List<Task> tasks;
  final int color;

  Todo({this.title, this.id, this.tasks = const [], this.color = 0xFFA088F6});

  @override
  List<Object> get props => [title, id, tasks, color];

  Todo copyWith({String id, String title, List<Task> tasks, int color}) {
    return Todo(
      title: title ?? this.title,
      color: color ?? this.color,
      tasks: tasks ?? this.tasks,
      id: id ?? this.id,
    );
  }
}
