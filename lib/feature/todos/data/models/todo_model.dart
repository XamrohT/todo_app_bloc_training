
import 'package:todo_app_bloc/feature/todos/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity{
  const TodoModel({required super.id, required super.content, required super.title});


  factory TodoModel.fromJson(Map<String,dynamic> json){
    final todo = TodoEntity.fromJson(json);
    return TodoModel(
      id: todo.id,
      title: todo.title,
      content: todo.content,
    );
  }

}