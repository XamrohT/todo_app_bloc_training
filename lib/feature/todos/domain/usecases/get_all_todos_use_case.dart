import 'package:todo_app_bloc/core/result/result.dart';
import 'package:todo_app_bloc/feature/todos/domain/entities/todo_entity.dart';
import 'package:todo_app_bloc/feature/todos/domain/repositories/i_todo_repository.dart';

class GetAllTodosUseCase{
  final ITodoRepository _repository;

  GetAllTodosUseCase(this._repository);

  Future<Result<List<TodoEntity>>> execute () async {
    return await _repository.getTodos();
  }
}