import 'package:flutter/material.dart';
import 'package:todo_bygaga/core/styles/colors.dart';

class TodoScroll extends StatefulWidget {
  @override
  _TodoScrollState createState() => _TodoScrollState();
}

class _TodoScrollState extends State<TodoScroll> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.todoListBackgroundColor,

      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 3),
          color: Colors.blue,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
        ),
      ),
//      ListView(
//        padding: EdgeInsets.all(10.0),
//        scrollDirection: Axis.horizontal,
//        children: <Widget>[
//          Container(
////            height: 100.0,
////            width: 20.0,
//            width: MediaQuery.of(context).size.width - 20.0,
//            color: Colors.yellow,
//          ),
//          Container(
////            width: 700.0,
//            width: MediaQuery.of(context).size.width - 20.0,
//
//            color: Colors.green,
//          ),
//          Container(
////            width: 700.0,
//            color: Colors.orange,
//          ),
//        ],
//      ),
    );
  }
}
