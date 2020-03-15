import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_bygaga/todo/domain/entities/task.dart';

class AddEditTask extends StatelessWidget {
  final Function(Task) addTask;
  final Function(Task) updateTask;
  final Color todoColor;
  final Task task;
  bool get isEditing => task != null;

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  const AddEditTask(
      {Key key,
      @required this.todoColor,
      this.task,
      this.addTask,
      this.updateTask})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: formKey,
        child: Container(
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                initialValue: isEditing ? task.description : '',
                minLines: 5,
                maxLines: 10,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20.0),
                  border: InputBorder.none,
                  hintText: isEditing ? 'Update task' : 'New task',
                ),
              ),
              Container(
                color: todoColor,
                height: 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.featured_play_list),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.mic),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.panorama),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(isEditing ? 'Update' : 'Create'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
