
import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:todo_app_bloc/feature/domain/entities/todo_entity.dart';
import 'package:todo_app_bloc/feature/domain/usecases/create_new_todo_use_case.dart';
import 'package:todo_app_bloc/feature/domain/usecases/get_all_todos_use_case.dart';
import 'package:todo_app_bloc/feature/domain/usecases/remove_todo_use_case.dart';


part 'todo_filter_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final List<TodoEntity> _todos = [];
  List<TodoEntity> get todos => _todos;
  TodoCubit({required this.createNewTodoUseCase, required this.getAllTodosUseCase,required this.removeTodoUseCase}) : super(InitialTodoState());

  final CreateNewTodoUseCase createNewTodoUseCase;
  final GetAllTodosUseCase getAllTodosUseCase;
  final RemoveTodoUseCase removeTodoUseCase;


  Future<void> createNewTodo(String id, String content) async {
    try{
      await  createNewTodoUseCase.execute(id, content); 
    }on Exception catch (e){
      throw e;
    }
  }

  Future<void> getAllTodos() async {
    try{
      final todos = await getAllTodosUseCase.execute();
      _todos.addAll(todos);
      emit(LoadedTodoState(_todos));
    }on Exception catch (e){
      throw e;
    }
  }

  Future<void> removeTodo(String id) async {
    try{
      await removeTodoUseCase.execute(id);
      _todos.removeWhere((element) => element.id == id);
      emit(LoadedTodoState(_todos));
    }on Exception catch (e){
      throw e;
    }
  }
}
