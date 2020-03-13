import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_bygaga/core/usecases/usecase.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';
import 'package:todo_bygaga/todo/domain/repositories/todo_repository.dart';
import 'package:todo_bygaga/todo/domain/use_cases/get_todo_list.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  MockTodoRepository mockTodoRepository;
  GetTodoList usecase;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = GetTodoList(mockTodoRepository);
  });

  final tList = [
    Todo(id: '1', title: 'Test1', tasks: [], color: 0xFF0000),
    Todo(id: '2', title: 'Test2', tasks: [], color: 0xFF0001)
  ];

  test('should get list', () async {
    // arrange
    when(mockTodoRepository.getList()).thenAnswer((_) async => Right(tList));
    // act
    final result = await usecase(NoParams());
    // assert
    verify(mockTodoRepository.getList());
    verifyNoMoreInteractions(mockTodoRepository);
    expect(result, Right(tList));
  });
}
