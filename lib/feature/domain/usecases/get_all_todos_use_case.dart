import 'package:todo_app_bloc/feature/domain/entities/todo_entity.dart';
import 'package:todo_app_bloc/feature/domain/repositories/i_todo_repository.dart';

class GetAllTodosUseCase{
  final ITodoRepository _repository;

  GetAllTodosUseCase(this._repository);

  Future<List<TodoEntity>> execute () async {
    return await _repository.getTodos();
  }
}