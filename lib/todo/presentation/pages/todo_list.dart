import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:todo_bygaga/core/styles/colors.dart';
import 'package:todo_bygaga/main.dart';
import 'package:todo_bygaga/todo/domain/entities/todo.dart';
import 'package:todo_bygaga/todo/presentation/widgets/todo_card.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage() {
    FlutterStatusbarcolor.setStatusBarColor(AppColors.todoBackgroundColor);
  }

  final List<Todo> todos = TEMP_DATA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.todoListBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                radius: 24.0,
                backgroundImage: NetworkImage(
                    'https://lh3.googleusercontent.com/-EyoG7expGyI/AAAAAAAAAAI/AAAAAAAAAAA/AKF05nAfYDBDIBSoF9LcXGuuPgR7gHMKEQ.CMID/s128-b16-cc-rp/photo.jpg'),
              ),
              Stack(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.notifications_none, color: Colors.white),
                    onPressed: () {},
                  ),
                  Positioned(
                    top: 5,
                    right: 8,
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.redAccent,
                      ),
                      child: Text(
                        '8',
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(10.0),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                crossAxisCount: 2,
                children: <Widget>[
                  TodoCard(
                    isCreateCard: true,
                  ),
                  TodoCard(
                    isCreateCard: false,
                    todo: todos[0],
                  ),
                  TodoCard(
                    isCreateCard: false,
                    todo: todos[1],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
