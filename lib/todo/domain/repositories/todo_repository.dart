import 'package:todo_bygaga/todo/data/models/TodoModel.dart';

abstract class TodoRepository {
  List<TodoModel> getList();
}
