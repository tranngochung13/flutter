import 'package:flutter/material.dart';
import 'package:todolist/todo/todo_header.dart';
import 'package:todolist/todo/todo_list.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          todoHeader(),
          Expanded(
            child: TodoListView(),
          ),
        ],
      ),
    );
  }
}
