import 'package:solid_principles/src/module/home/domain/entity/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> fetchAll();
}
