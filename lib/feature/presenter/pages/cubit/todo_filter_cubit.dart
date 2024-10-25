
import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:todo_app_bloc/feature/domain/entities/todo_entity.dart';
import 'package:todo_app_bloc/feature/domain/usecases/create_new_todo_use_case.dart';
import 'package:todo_app_bloc/feature/domain/usecases/get_all_todos_use_case.dart';


part 'todo_filter_state.dart';

class TodoStateCubit extends Cubit<TodoState> {
  final List<TodoEntity> _todos = [];
  List<TodoEntity> get todos => _todos;
  TodoStateCubit({required this.createNewTodoUseCase, required this.getAllTodosUseCase}) : super(InitialTodoState());

  final CreateNewTodoUseCase createNewTodoUseCase;
  final GetAllTodosUseCase getAllTodosUseCase;


  Future<void> createNewTodo(String id, String content) async {
    try{
      await  createNewTodoUseCase.execute(id, content); 
    }on Exception catch (e){
      throw e;
    }
  }

  Future
}
