import 'package:todo_app_bloc/core/result/result.dart';
import 'package:todo_app_bloc/feature/domain/repositories/i_todo_repository.dart';

class RemoveTodoUseCase{
  final ITodoRepository _repository;

  RemoveTodoUseCase(this._repository);

  Future<Result<void>> execute (String id) async {
    return await _repository.removeTodo(id);
  }
}