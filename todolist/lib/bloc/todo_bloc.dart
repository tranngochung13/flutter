import 'dart:async';
import 'dart:math';

import 'package:todolist/base/base_bloc.dart';
import 'package:todolist/base/base_event.dart';
import 'package:todolist/db/todo_table.dart';

import '../event/add_todo_event.dart';
import '../event/delete_todo_event.dart';
import '../model/todo.dart';

class TodoBloc extends BaseBloc {
  TodoTable _todoTable = TodoTable();
  // ignore: close_sinks
  StreamController<List<Todo>> _todoListStreamController =
      StreamController<List<Todo>>();
  Stream<List<Todo>> get todoListStream => _todoListStreamController.stream;

  var _randomInt = Random();
  // ignore: deprecated_member_use
  List<Todo> _todoListData = <Todo>[];

  initData() async {
    await _todoTable.selectAllTodo();
    // ignore: unnecessary_null_comparison
    if (_todoListData == null) {
      return;
    }
    _todoListStreamController.sink.add(_todoListData);
  }

  _addTodo(Todo todo) async {
    await _todoTable.insertTodo(todo);

    _todoListData.add(todo);
    _todoListStreamController.sink.add(_todoListData);
  }

  _deleteTodo(Todo todo) async {
    await _todoTable.deleteTodo(todo);

    _todoListData.remove(todo);
    _todoListStreamController.sink.add(_todoListData);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is AddTodoEvent) {
      Todo todo = Todo.formData(_randomInt.nextInt(100000), event.content);
      _addTodo(todo);
    } else if (event is DeleteTodoEvent) {
      _deleteTodo(event.todo);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _todoListStreamController.close();
  }
}
