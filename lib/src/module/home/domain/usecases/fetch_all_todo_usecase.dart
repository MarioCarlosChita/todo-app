import 'package:solid_principles/src/core/utils/constants.dart';
import 'package:solid_principles/src/module/home/domain/entity/todo.dart';
import 'package:solid_principles/src/module/home/domain/repository/todo_repository.dart';

class fetchAllTodoUsecase {
  fetchAllTodoUsecase({required this.todoRepository});
  final TodoRepository todoRepository;

  Future<List<Todo>> fetchAll() async {
    return LIST_TODO;
  }
}
