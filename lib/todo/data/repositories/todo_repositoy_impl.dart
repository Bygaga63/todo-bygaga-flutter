import 'package:flutter/material.dart';
import 'package:todo_bygaga/todo/data/models/TaskModel.dart';
import 'package:todo_bygaga/todo/data/models/TodoModel.dart';
import 'package:todo_bygaga/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  @override
  List<TodoModel> getList() {
    return [
      TodoModel(
        id: 1,
        title: 'Create flutter todo list',
        color: Color(0xFFA088F6),
        tasks: [
          TaskModel(id: 1, isComplete: false, description: 'Find desighn'),
          TaskModel(id: 2, isComplete: false, description: 'Create project'),
          TaskModel(
              id: 3,
              isComplete: true,
              description: 'Add clean arcitecture structure'),
          TaskModel(id: 4, isComplete: true, description: 'Create MVP')
        ],
      ),
      TodoModel(
        id: 2,
        title: 'Game App',
        color: Colors.yellow,
        tasks: [
          TaskModel(id: 1, isComplete: false, description: 'Dark theme'),
          TaskModel(id: 2, isComplete: false, description: 'Filters')
        ],
      ),
    ];
  }
}
