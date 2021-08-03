import 'package:todolist/base/base_event.dart';
import 'package:todolist/model/todo.dart';

class DeleteTodoEvent extends BaseEvent {
  Todo todo;

  DeleteTodoEvent(this.todo);
}
