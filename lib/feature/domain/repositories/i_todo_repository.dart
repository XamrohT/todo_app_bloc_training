import 'package:todo_app_bloc/core/result/result.dart';
import 'package:todo_app_bloc/feature/domain/entities/todo_entity.dart';

abstract class ITodoRepository{
  Future<Result<void>> createTodo(String id, String content);
  Future<Result<List<TodoEntity>>> getTodos();
  Future<void> removeTodo(String id);
}