
import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:todo_app_bloc/core/result/result.dart';
import 'package:todo_app_bloc/feature/todos/domain/entities/todo_entity.dart';
import 'package:todo_app_bloc/feature/todos/domain/usecases/create_new_todo_use_case.dart';
import 'package:todo_app_bloc/feature/todos/domain/usecases/get_all_todos_use_case.dart';
import 'package:todo_app_bloc/feature/todos/domain/usecases/remove_todo_use_case.dart';


part 'todo_filter_state.dart';

class TodoCubit extends Cubit<TodoState> {
  List<TodoEntity> get todos => _todos;
  TodoCubit({required this.createNewTodoUseCase, required this.getAllTodosUseCase,required this.removeTodoUseCase}) : super(InitialTodoState());

  final CreateNewTodoUseCase createNewTodoUseCase;
  final GetAllTodosUseCase getAllTodosUseCase;
  final RemoveTodoUseCase removeTodoUseCase;

  late final List<TodoEntity> _todos= [];

  Future<Result<void>> createNewTodo(String title, String content) async {
      return await createNewTodoUseCase.execute(title, content); 
  }

  Future<void> getAllTodos() async {
    emit(LoadingTodoState());
    final data = await getAllTodosUseCase.execute();
    _todos.clear();
    if(data.isFailure){
       emit(ErrorTodoState(data.error!));
    }
    _todos.addAll(data.data!);   
    emit(LoadedTodoState());
  }

  Future<Result<void>> removeTodo(String id) async {
    return await removeTodoUseCase.execute(id);
  }
}
