import 'package:meta/meta.dart';
import 'package:todo_bygaga/todo/domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({
    @required String id,
    @required String description,
    @required bool isComplete,
  }) : super(id: id, description: description, isComplete: isComplete);
}
