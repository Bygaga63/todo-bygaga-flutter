import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              minLines: 5,
              maxLines: 10,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20.0),
                border: InputBorder.none,
                hintText: 'New task',
              ),
            ),
            Container(
              color: Colors.purple,
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
