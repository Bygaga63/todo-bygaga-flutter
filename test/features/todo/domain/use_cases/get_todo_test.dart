import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';
import 'package:todo_bygaga/todo/domain/repositories/todo_repository.dart';
import 'package:todo_bygaga/todo/domain/use_cases/get_todo.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  GetTodo usecase;
  MockTodoRepository mockTodoRepository;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = GetTodo(mockTodoRepository);
  });

  final tId = '1';
  final todo = Todo(id: '1', color: 0xFFA088F6, tasks: [], title: 'Test1');

  test('should get todo by id', () async {
    // arrange
    when(mockTodoRepository.getOne(tId)).thenAnswer((_) async => Right(todo));
    // act
    final result = await usecase(Params(id: tId));
    // assert
    verify(mockTodoRepository.getOne(tId));
    verifyNoMoreInteractions(mockTodoRepository);
    expect(result, Right(todo));
  });
}
