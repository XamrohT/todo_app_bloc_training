import 'package:flutter/material.dart';
import 'package:todo_app_bloc/feature/todos/presenter/view/pages/create_page.dart';
import 'package:todo_app_bloc/feature/todos/presenter/view/pages/todo_page.dart';

Route<dynamic> onGenerateRoute (RouteSettings settings){
  switch(settings.name){
    case '/todos_page':
      return MaterialPageRoute(builder: (_) => const TodosPage());
    case '/create_todo_page':
      return MaterialPageRoute(builder: (_) => const CreateTodosPage());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold(
        body: Center(
          child: Text('No route defined for this page'),
        ),
      ));
  }
}