import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/bloc/todo_bloc.dart';
import 'package:todolist/todo/todo_list_container.dart';

import 'db/todo_database.dart';

void main() async {
  await TodoDatabase.instance.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('todo')),
        body: Provider<TodoBloc>.value(
          value: TodoBloc(),
          child: TodoList(),
        ),
      ),
    );
  }
}
