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
  List<Object> get props => [id, description, isComplete];

  Task copyWith({String id, String description, bool isComplete}) {
    return Task(
      id: id ?? this.id,
      description: description ?? this.description,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}
