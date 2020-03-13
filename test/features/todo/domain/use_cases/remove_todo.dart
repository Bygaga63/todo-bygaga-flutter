import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_bygaga/todo/domain/repositories/todo_repository.dart';
import 'package:todo_bygaga/todo/domain/use_cases/remove_todo.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  MockTodoRepository mockTodoRepository;
  RemoveTodo usecase;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = RemoveTodo(mockTodoRepository);
  });

  final tId = '1';

  test('should remove by id', () async {
    // arrange
    when(mockTodoRepository.remove(any)).thenAnswer((_) async => Right(null));
    // act
    final result = await usecase(Params(id: tId));
    // assert
    verify(mockTodoRepository.remove(tId));
    verifyNoMoreInteractions(mockTodoRepository);
    expect(result, Right(null));
  });
}
