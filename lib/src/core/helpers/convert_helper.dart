import 'package:solid_principles/src/module/home/domain/entity/todo.dart';

List<Todo> convertMapToObjectList({required Map<String, dynamic> map}) {
  List<Todo> data = [];
  map.forEach((key, value) {
    Todo item = Todo.fromJson(value[key]);
    data.add(item);
  });
  return data;
}
