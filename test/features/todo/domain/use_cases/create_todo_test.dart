import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';
import 'package:todo_bygaga/todo/domain/repositories/todo_repository.dart';
import 'package:todo_bygaga/todo/domain/use_cases/create_todo.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  MockTodoRepository mockTodoRepository;
  CreateTodo usecase;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = CreateTodo(mockTodoRepository);
  });

  final tCandidate = Todo(tasks: [], color: 0xFF1234, title: 'Test1');
  final tCreated = Todo(id: '1', tasks: [], color: 0xFF1234, title: 'Test1');

  test('should create entity and set id', () async {
    //arrange
    when(mockTodoRepository.create(tCandidate))
        .thenAnswer((_) async => Right(tCreated));
    //act
    final result = await usecase(Params(todo: tCandidate));
    //assert
    verify(mockTodoRepository.create(tCandidate));
    verifyNoMoreInteractions(mockTodoRepository);
    expect(result, Right(tCreated));
  });
}
