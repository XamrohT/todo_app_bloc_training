// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app_bloc/feature/todos/domain/entities/todo_entity.dart';
import 'package:todo_app_bloc/feature/todos/presenter/cubit/todo_filter_cubit.dart';
import 'package:todo_app_bloc/shared/styles/styles.dart';

class ListTileAuxWidget extends StatefulWidget {
  final TodoEntity todo;

  const ListTileAuxWidget({
    super.key,
    required this.todo,
  });

  @override
  State<ListTileAuxWidget> createState() => _ListTileAuxWidgetState();
}

class _ListTileAuxWidgetState extends State<ListTileAuxWidget> {
  @override
  void initState() {
    super.initState();
    final cubit = GetIt.I.get<TodoCubit>();
  }

  @override
  Widget build(BuildContext context) {
    bool check = false;
    return ExpansionTile(
      minTileHeight: 100,
      title: Text(widget.todo.title),
      leading: Checkbox(
        value: check,
        onChanged: (check) {
          setState(() {
            check = check!;
          });
        },
      ),
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxStyles.primaryBox,
          child: Text(
            widget.todo.content,
            style: const TextStyle(fontSize: 14, fontFamily: 'Urbanist'),
          ),
        ),
      ],
    );
  }
}
