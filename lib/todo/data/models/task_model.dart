import 'package:meta/meta.dart';
import 'package:todo_bygaga/todo/domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({
    String id,
    @required String description,
    @required bool isComplete,
  }) : super(id: id, description: description, isComplete: isComplete);

  static Task toTask(TaskModel taskModel) => Task(
      id: taskModel.id,
      description: taskModel.description,
      isComplete: taskModel.isComplete ?? false);
}
