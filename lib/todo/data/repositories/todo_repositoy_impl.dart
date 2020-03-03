import 'package:todo_bygaga/todo/data/models/TaskModel.dart';
import 'package:todo_bygaga/todo/data/models/TodoModel.dart';
import 'package:todo_bygaga/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  @override
  List<TodoModel> getList() {
    return [
      TodoModel(
        id: 1,
        title: 'Santorini',
        tasks: [
          TaskModel(id: 1, isComplete: false, description: 'Buy Headphones'),
          TaskModel(
              id: 2, isComplete: false, description: 'Send flight itinerary')
        ],
      ),
      TodoModel(
        id: 2,
        title: 'Game App',
        tasks: [
          TaskModel(id: 1, isComplete: false, description: 'Dark theme'),
          TaskModel(id: 2, isComplete: false, description: 'Filters')
        ],
      ),
    ];
  }
}
