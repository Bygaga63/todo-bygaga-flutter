import 'package:equatable/equatable.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';

abstract class TodosState extends Equatable {
  const TodosState();
  @override
  List<Object> get props => [];
}

class TodosLoading extends TodosState {}

class TodosLoaded extends TodosState {
  final List<Todo> todos;

  TodosLoaded([this.todos = const []]);

  @override
  List<Object> get props => [todos];
}

class TodosNotLoaded extends TodosState {}
