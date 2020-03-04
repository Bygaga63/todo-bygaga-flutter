import 'package:flutter/material.dart';
import 'package:todo_bygaga/todo/data/models/TaskModel.dart';

class TodoModel {
  final int id;
  final String title;
  final List<TaskModel> tasks;
  final Color color;

  TodoModel({
    this.id,
    this.title,
    this.tasks,
    this.color,
  });
}
