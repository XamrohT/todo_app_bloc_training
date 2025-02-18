import 'package:todo_app_bloc/core/database/database_helper.dart';
import 'package:todo_app_bloc/core/result/result.dart';
import 'package:todo_app_bloc/feature/data/models/todo_model.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/todo_entity.dart';

abstract class TodoRemoteRemoteDatasource {
  Future<Result<void>> createTodo(String title, String content);
  Future<List<TodoEntity>> getTodos();
  Future<void> removeTodo(String id);
}

class TodoRemoteDatasourceImplementation implements TodoRemoteRemoteDatasource {
  final DatabaseHelper _databaseHelper;

  TodoRemoteDatasourceImplementation(this._databaseHelper);
  @override
  Future<Result<void>>createTodo(String title, String content) async {
    try {
      const uuid = Uuid();
      if(title.isEmpty || content.isEmpty){
        return Result.failure("Title or content cannot be empty");
      }
      var todo = TodoModel(id: uuid.v6(), title: title, content: content);
      _databaseHelper.insert(todo);
      return Result.success(null);
    }catch(e){
      return Result.failure("erro:$e");
    }
  }
  
  @override
  Future<List<TodoEntity>> getTodos() {
    // TODO: implement getTodos
    throw UnimplementedError();
  }
  
  @override
  Future<void> removeTodo(String id) {
    // TODO: implement removeTodo
    throw UnimplementedError();
  }
  }
