import 'package:todo_app_bloc/core/database/database_helper.dart';
import 'package:todo_app_bloc/core/result/result.dart';
import 'package:todo_app_bloc/feature/todos/data/models/todo_model.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/todo_entity.dart';

abstract class TodoRemoteRemoteDatasource {
  Future<Result<void>> createTodo(String title, String content);
  Future<Result<List<TodoEntity>>> getTodos();
  Future<Result<void> >removeTodo(String id);
}

class TodoRemoteDatasourceImplementation implements TodoRemoteRemoteDatasource {
  final DatabaseHelper _databaseHelper;

  TodoRemoteDatasourceImplementation(this._databaseHelper);
  @override
  Future<Result<void>> createTodo(String title, String content) async {
    try {
      const uuid = Uuid();
      if (title.isEmpty || content.isEmpty) {
        return Result.failure("Title or content cannot be empty");
      }
      var todo = TodoModel(id: uuid.v6(), title: title, content: content);
      _databaseHelper.insert(todo);
      return Result.success(null);
    } catch (e) {
      return Result.failure("erro:$e");
    }
  }

  @override
  Future<Result<List<TodoEntity>>> getTodos() async {
    try {
      final todos = await _databaseHelper.getAll();
      return Result.success(todos);
    } catch (e) {
      return Result.failure("erro:$e");
    }
  }

  @override
  Future<Result<void>> removeTodo(String id) async {
    try {
      if (id.isEmpty) {
        return Result.failure("Id cannot be empty");
      }
      await _databaseHelper.remove(id);
      return Result.success(null);
    } catch (e) {
      return Result.failure("erro:$e");
    }
  }
}
