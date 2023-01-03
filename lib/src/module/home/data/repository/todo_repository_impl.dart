import 'package:solid_principles/src/core/helpers/convert_helper.dart';
import 'package:solid_principles/src/module/home/data/datasource/datalocal/data_local.dart';
import 'package:solid_principles/src/module/home/domain/entity/todo.dart';
import 'package:solid_principles/src/module/home/domain/repository/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  TodoRepositoryImpl({required this.dataSourceLocal});
  final DataSourceLocal dataSourceLocal;

  @override
  Future<List<Todo>> fetchAll() async {
    try {
      final Map<String, dynamic> resulData = await dataSourceLocal.fetchTodo();
      List<Todo> lista = convertMapToObjectList(map: resulData);
      return lista;
    } catch (error) {
      throw Exception("Error ao carregar os dados");
    }
  }
}
