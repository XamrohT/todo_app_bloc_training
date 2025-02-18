import 'package:todo_app_bloc/feature/data/data_source/todo_remote_datasource.dart';
import 'package:todo_app_bloc/feature/domain/entities/todo_entity.dart';
import 'package:todo_app_bloc/feature/domain/repositories/i_todo_repository.dart';

class TodoRepository implements ITodoRepository {
  final TodoRemoteRemoteDatasource _remoteDatasource;

  TodoRepository(this._remoteDatasource);
  @override
  Future<void> createTodo(String id, String content) {
    // TODO: implement createTodo
    throw UnimplementedError();
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
