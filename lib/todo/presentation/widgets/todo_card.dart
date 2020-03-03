import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todo_bygaga/todo/data/models/TodoModel.dart';

class TodoCard extends StatelessWidget {
  bool isCreateCard;
  final TodoModel todo;

  TodoCard({this.todo, this.isCreateCard});

  List<Widget> _createContent() => [
        Icon(Icons.add),
        Text(
          'Create',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        )
      ];

  List<Widget> _todoContent() => [
        CircularPercentIndicator(
          radius: 25.0,
          lineWidth: 3.0,
          percent: 0.8,
          backgroundColor: Colors.grey,
          progressColor: Colors.blue,
        ),
        Text(
          todo.title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemExtent: 30.0,
            itemCount: todo.tasks.length,
            itemBuilder: (BuildContext context, int index) {
              final description = todo.tasks[index].description;
              return ListTile(
                dense: true,
                title: Text(description),
                contentPadding: EdgeInsets.all(0),
              );
            },
          ),
        )
      ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: isCreateCard ? _createContent() : _todoContent(),
        ),
      ),
    );
  }
}
