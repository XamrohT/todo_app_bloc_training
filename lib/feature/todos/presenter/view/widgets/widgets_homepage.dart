// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app_bloc/feature/todos/domain/entities/todo_entity.dart';
import 'package:todo_app_bloc/feature/todos/presenter/cubit/todo_filter_cubit.dart';
import 'package:todo_app_bloc/feature/todos/presenter/view/widgets/custom_checkbox/custom_checkbox.dart';
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
  bool isChecked = false;
  @override
  void initState() {
    super.initState();
    final cubit = GetIt.I.get<TodoCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,8,16,8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 242, 242, 247),
        ),
        child: ExpansionTile(
          minTileHeight: 50,
          trailing: const Icon(Icons.more_horiz,color: AppColors.boxTextColors,),
          shape: ShapeBorder.lerp(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            1,
          ),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          expandedAlignment: Alignment.centerLeft,
          backgroundColor: AppColors.boxColors,
          title: Text(widget.todo.title),
          leading: const CustomCheckbox(),
          children: [
            Padding(
              padding: const EdgeInsets.only(left:58),
              child: Text(
                widget.todo.content,
                style: const TextStyle(fontSize: 14, fontFamily: 'Urbanist',color: AppColors.boxTextColors),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
