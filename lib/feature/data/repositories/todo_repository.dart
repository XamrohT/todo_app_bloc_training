import 'package:todo_app_bloc/feature/data/data_source/todo_remote_datasource.dart';
import 'package:todo_app_bloc/feature/domain/entities/todo_entity.dart';
import 'package:todo_app_bloc/feature/domain/repositories/i_todo_repository.dart';

class TodoRepository implements ITodoRepository {
  final TodoRemoteRemoteDatasource _remoteDatasource;

  TodoRepository(this._remoteDatasource);
  @override
  Future<void> createTodo(String id, String content) {
   return _remoteDatasource.createTodo(id, content);
  }

  @override
  Future<List<TodoEntity>> getTodos() {
    return _remoteDatasource.getTodos();
  }

  @override
  Future<void> removeTodo(String id) {
    return _remoteDatasource.removeTodo(id);
  }
}
