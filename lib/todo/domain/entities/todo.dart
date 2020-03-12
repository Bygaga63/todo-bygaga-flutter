import 'package:equatable/equatable.dart';
import 'package:todo_bygaga/todo/domain/entities/task.dart';

class Todo extends Equatable {
  final String id;
  final String title;
  final List<Task> tasks;
  final int color;
  Todo({this.id, this.title, this.tasks, this.color});

  @override
  List<Object> get props => [];
}
