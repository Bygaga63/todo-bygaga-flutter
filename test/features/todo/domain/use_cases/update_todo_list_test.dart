import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';
import 'package:todo_bygaga/todo/domain/repositories/todo_repository.dart';
import 'package:todo_bygaga/todo/domain/use_cases/update_todo.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  MockTodoRepository mockTodoRepository;
  UpdateTodo usecase;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = UpdateTodo(mockTodoRepository);
  });

  final tId = '1';
  final todo = Todo(id: '1', tasks: [], color: 0xFF1234, title: 'Test1');
  final updatedCandidate =
      Todo(id: '1', tasks: [], color: 0xFF1234, title: 'Test2');

  test('should update todo values', () async {
    //arrange
    when(mockTodoRepository.getOne(any)).thenAnswer((_) async => Right(todo));
    when(mockTodoRepository.save(any))
        .thenAnswer((_) async => Right(updatedCandidate));
    //act
    final result = await usecase(Params(id: tId, todo: todo));
    //assert
    verify(mockTodoRepository.getOne(tId));
    verify(mockTodoRepository.save(todo));
    expect(result, Right(updatedCandidate));
  });
}
