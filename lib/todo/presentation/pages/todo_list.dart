import 'package:flutter/material.dart';
import 'package:todo_bygaga/todo/data/models/TodoModel.dart';
import 'package:todo_bygaga/todo/data/repositories/todo_repositoy_impl.dart';
import 'package:todo_bygaga/todo/presentation/widgets/todo_card.dart';

class TodoListPage extends StatelessWidget {
  final List<TodoModel> todos = TodoRepositoryImpl().getList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,

          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                radius: 24.0,
                backgroundImage: NetworkImage(
                    'https://lh3.googleusercontent.com/-EyoG7expGyI/AAAAAAAAAAI/AAAAAAAAAAA/AKF05nAfYDBDIBSoF9LcXGuuPgR7gHMKEQ.CMID/s128-b16-cc-rp/photo.jpg'),
              ),
              IconButton(
                icon: Icon(Icons.notifications_none, color: Colors.white),
                onPressed: () {},
              )
            ],
          ),
        ),
        body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
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
        )));
  }
}
