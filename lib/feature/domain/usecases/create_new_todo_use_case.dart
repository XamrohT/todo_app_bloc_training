import 'package:todo_app_bloc/core/result/result.dart';
import 'package:todo_app_bloc/feature/domain/repositories/i_todo_repository.dart';

class CreateNewTodoUseCase{
  final ITodoRepository _repository;

  CreateNewTodoUseCase(this._repository);

  Future<Result<void>> execute (String id, String content) async {
    return await  _repository.createTodo(id,content);
  }
}