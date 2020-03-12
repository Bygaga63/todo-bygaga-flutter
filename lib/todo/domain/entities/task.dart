import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Task extends Equatable {
  final String id;
  final String description;
  final bool isComplete;

  Task(
      {@required this.id,
      @required this.description,
      @required this.isComplete});

  @override
  List<Object> get props => [description, isComplete];
}
