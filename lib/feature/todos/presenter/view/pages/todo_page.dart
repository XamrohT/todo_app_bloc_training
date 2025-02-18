import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app_bloc/feature/todos/presenter/cubit/todo_filter_cubit.dart';
import 'package:todo_app_bloc/feature/todos/presenter/view/widgets/app_bar.dart/app_bar.dart';
import 'package:todo_app_bloc/feature/todos/presenter/view/widgets/bottom_navigator_bar/bottom_navigator_bar.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  late final TodoCubit cubit;
  int count= 5;

  @override
  void initState() {
    super.initState();
    cubit = GetIt.I.get<TodoCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: cubit,
        listener: (context, state) {
          if (state is LoadedTodoState) {
            print('Loaded');
          }
        },
        builder: (state, context) {
          if (state is LoadingTodoState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return Scaffold(
            appBar: const AppBarCustomized(),
            bottomNavigationBar: const BottomNavigatorBar(),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Welcome,",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Urbanist'),
                        ),
                        Text(
                          " John",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Urbanist'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("you've got $count tasks to do.",style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: 'Urbanist'),),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
