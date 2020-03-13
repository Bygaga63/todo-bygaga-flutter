import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String text;
  Failure();
  Failure.message(this.text);
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class TodoFailure extends Failure {
  TodoFailure.message(String text) : super.message(text);
}
