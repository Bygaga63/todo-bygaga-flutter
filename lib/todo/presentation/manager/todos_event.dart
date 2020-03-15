import 'package:equatable/equatable.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';

abstract class TodosEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetTodoEvent extends TodosEvent {
  final String id;

  GetTodoEvent(this.id);
}

class GetTodosEvent extends TodosEvent {}

class CreateTodoEvent extends TodosEvent {
  final Todo createTodo;

  CreateTodoEvent(this.createTodo);

  @override
  List<Object> get props => [createTodo];
}

class UpdateTodoEvent extends TodosEvent {
  final Todo updatedTodo;
  final String id;
  UpdateTodoEvent(this.id, this.updatedTodo);

  @override
  List<Object> get props => [id, updatedTodo];
}

class RemoveTodoEvent extends TodosEvent {
  final String id;

  RemoveTodoEvent(this.id);

  @override
  List<Object> get props => [id];
}
