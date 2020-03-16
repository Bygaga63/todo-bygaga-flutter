import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_bygaga/core/error/failures.dart';
import 'package:todo_bygaga/core/usecases/usecase.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';
import 'package:todo_bygaga/todo/domain/use_cases/get_todo.dart';
import 'package:todo_bygaga/todo/domain/use_cases/get_todo_list.dart';
import 'package:todo_bygaga/todo/domain/use_cases/remove_todo.dart';
import 'package:todo_bygaga/todo/domain/use_cases/update_todo.dart';

import './bloc.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final GetTodo todo;
  final GetTodoList todoList;
  final UpdateTodo update;
  final RemoveTodo remove;

  TodosBloc({this.todo, this.todoList, this.update, this.remove});

  @override
  TodosState get initialState => TodosLoading();

  @override
  Stream<TodosState> mapEventToState(
    TodosEvent event,
  ) async* {
    if (event is GetTodosEvent) {
      final result = await todoList(NoParams());
      yield* _eitherLoadedOrErrorState(result);
    }
  }

  Stream<TodosState> _eitherLoadedOrErrorState(
    Either<Failure, List<Todo>> failureOrTodoList,
  ) async* {
    yield failureOrTodoList.fold(
      (failure) => TodosNotLoaded(message: failure.text),
      (todos) => TodosLoaded(todos),
    );
  }
}
