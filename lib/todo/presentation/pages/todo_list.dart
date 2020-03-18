import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:todo_bygaga/core/styles/colors.dart';
import 'package:todo_bygaga/todo/presentation/manager/bloc.dart';
import 'package:todo_bygaga/todo/presentation/widgets/todo_card_list.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage() {
    FlutterStatusbarcolor.setStatusBarColor(AppColors.todoBackgroundColor);
  }

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
      body: Column(children: <Widget>[
        SizedBox(
          height: 50.0,
        ),
        BlocBuilder<TodosBloc, TodosState>(
          builder: (BuildContext context, TodosState state) {
            if (state is TodosLoading) {
              return Text('loading...');
            } else if (state is TodosLoaded) {
              return TodoCardList(todos: state.todos);
            } else if (state is TodosNotLoaded) {
              return Text('not loaded');
            }
            return Container();
          },
        )
      ]),
    );
  }
}
