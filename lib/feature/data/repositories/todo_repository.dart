import 'package:todo_app_bloc/core/result/result.dart';
import 'package:todo_app_bloc/feature/data/data_source/todo_remote_datasource.dart';
import 'package:todo_app_bloc/feature/domain/entities/todo_entity.dart';
import 'package:todo_app_bloc/feature/domain/repositories/i_todo_repository.dart';

class TodoRepository implements ITodoRepository {
  final TodoRemoteRemoteDatasource _remoteDatasource;

  TodoRepository(this._remoteDatasource);
  @override
  Future<Result<void>> createTodo(String content, String title) async {
   return await _remoteDatasource.createTodo(title, content);
  }

  @override
  Future<Result<List<TodoEntity>>> getTodos() async {
    return await _remoteDatasource.getTodos();
  }

  @override
  Future<Result<void>> removeTodo(String id) {
    return _remoteDatasource.removeTodo(id);
  }
}
