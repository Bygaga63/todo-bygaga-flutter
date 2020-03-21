import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';
import 'package:todo_bygaga/todo/presentation/widgets/simple_card.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final int index;
  TodoCard({this.todo, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SimpleCard(
        onTap: () {
          Navigator.of(context).pushNamed<bool>('/todo/$index');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
          ],
        ),
      ),
    );
  }
}
