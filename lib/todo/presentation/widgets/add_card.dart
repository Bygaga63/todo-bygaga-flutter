import 'package:flutter/material.dart';
import 'package:todo_bygaga/todo/presentation/widgets/simple_card.dart';

class AddCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleCard(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.add),
          Text(
            'Create',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
