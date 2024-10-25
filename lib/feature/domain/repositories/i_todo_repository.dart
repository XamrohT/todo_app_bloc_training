import 'package:todo_app_bloc/feature/domain/entities/todo_entity.dart';

abstract class ITodoRepository{
  Future<void> createTodo(String id, String content);
  Future<TodoEntity> getTodos();
}