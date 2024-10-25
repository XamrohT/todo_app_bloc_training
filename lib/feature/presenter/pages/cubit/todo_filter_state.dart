part of 'todo_filter_cubit.dart';

abstract class TodoState {

}

class InitialTodoState extends TodoState{

}
class LoadingTodoState extends TodoState{
  
}
class LoadedTodoState extends TodoState{
  final List<String> todos;

  LoadedTodoState(this.todos);
}
class ErrorTodoState extends TodoState{
  String message;
  ErrorTodoState(this.message);
}



