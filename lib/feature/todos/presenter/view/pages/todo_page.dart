import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app_bloc/feature/todos/presenter/cubit/todo_filter_cubit.dart';
import 'package:todo_app_bloc/feature/todos/presenter/view/widgets/app_bar.dart/app_bar.dart';
import 'package:todo_app_bloc/feature/todos/presenter/view/widgets/bottom_navigator_bar/bottom_navigator_bar.dart';

import '../widgets/widgets_homepage.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  final cubit = GetIt.I.get<TodoCubit>();
  int count = 0;

  @override
  void initState() {
    super.initState();
    _initializePage();
  }

  Future<void> _initializePage() async {
    await cubit.getAllTodos();

  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: cubit,
      listener: (context, state) {
        if (state is ErrorTodoState) {
          debugPrint("error");
          SnackBar(
            content: Text(state.message),
            behavior: SnackBarBehavior.floating,
          );
        }
        if(state is LoadedTodoState){
          count = cubit.todos.length;
        }
      },
      builder: (context, state) {
        debugPrint(state.toString());
        if (state is LoadingTodoState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }
        if (state is LoadedTodoState) {
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
                    child: Text(
                      "you've got $count tasks to do.",
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontFamily: 'Urbanist'),
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    child: ListView.builder(
                      itemCount: cubit.todos.length,
                      itemBuilder: (context, index) {
                        return ListTileAuxWidget(todo: cubit.todos[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
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
                  child: Text(
                    "you've got $count tasks to do.",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: 'Urbanist'),
                  ),
                ),
                // const SizedBox(
                //   child: Center(
                //     child: CircularProgressIndicator.adaptive(),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
