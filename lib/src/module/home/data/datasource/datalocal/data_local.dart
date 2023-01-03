
import 'package:localstorage/localstorage.dart';

import '../../../../../core/utils/constants.dart';

class  DataSourceLocal{

  DataSourceLocal({required this.localStorage});
  final LocalStorage localStorage;

  Future<Map<String ,dynamic>> fetchTodo() async {
    return  localStorage.getItem(TODO_LOCAL_NAME);
  }
}