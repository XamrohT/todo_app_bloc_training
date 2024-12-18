// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/feature/presenter/cubit/todo_filter_cubit.dart';

class ListTileAuxWidget extends StatefulWidget {
  final List<String> todos;

   const ListTileAuxWidget({
    super.key,
    required this.todos,
  });

  @override
  State<ListTileAuxWidget> createState() => _ListTileAuxWidgetState();
}

class _ListTileAuxWidgetState extends State<ListTileAuxWidget> {
  late final TodoStateCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<TodoStateCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: widget.todos.length,itemBuilder: (_,index){
        return ListTile(
          title: Text(widget.todos[index]),
          trailing: IconButton(icon: const Icon(Icons.delete,color: Colors.red,),onPressed: (){
            cubit.removeTodo(widget.todos[index]);
          },),
        );
    });
  }
}
