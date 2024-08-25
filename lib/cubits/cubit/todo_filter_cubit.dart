import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_filter_state.dart';

class TodoStateCubit extends Cubit<TodoState> {
  final List<String> _todos = [];
  List<String> get todos => _todos;
  TodoStateCubit() : super(InitialTodoState());

  //gerencia o estado do cubit;
  //onde o cubit emite um novo "state"
  //por via de um "emit"
  Future<void> addTodo({required String todo}) async {
    emit(LoadingTodoState());

    await Future.delayed(const Duration(seconds: 1));

    if(_todos.contains(todo)){
      emit(ErrorTodoState("Tarefa já existente"));
    }else{
      _todos.add(todo);
      emit(LoadedTodoState(_todos));emit(LoadedTodoState(_todos));
    }
  }

  Future<void> removeTodo({required int index})async{
    emit(LoadingTodoState());

    await Future.delayed(const Duration(seconds: 1));
    
    _todos.removeAt(index);
    print("aqui");

    emit(LoadedTodoState(_todos));
  }
}
