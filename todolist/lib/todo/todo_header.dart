import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/bloc/todo_bloc.dart';
import 'package:todolist/event/add_todo_event.dart';

// ignore: camel_case_types
class todoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var txtTodoController = TextEditingController();
    var bloc = Provider.of<TodoBloc>(context);

    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: txtTodoController,
            decoration: InputDecoration(
              labelText: 'add todo',
              hintText: 'add todo',
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        // ignore: deprecated_member_use
        RaisedButton.icon(
          onPressed: () {
            bloc.event.add(AddTodoEvent(txtTodoController.text));
          },
          icon: Icon(Icons.add),
          label: Text('add'),
        ),
      ],
    );
  }
}
