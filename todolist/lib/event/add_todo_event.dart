import 'package:todolist/base/base_event.dart';

class AddTodoEvent extends BaseEvent {
  String content;

  AddTodoEvent(this.content);
}
