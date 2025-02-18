import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app_bloc/feature/presenter/cubit/todo_filter_cubit.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  late final TodoCubit cubit;
  final TextEditingController _todoAddControler = TextEditingController();

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
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _todoAddControler,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          cubit.createNewTodo(DateTime.now().toString(),
                              _todoAddControler.text);
                          _todoAddControler.clear();
                        },
                        child: const Icon(Icons.add)),
                  ),
                  SizedBox(
                    height: 500,
                    child: BlocBuilder(
                      bloc: cubit,
                      builder: (context, state) {
                        if (state is InitialTodoState) {
                          return const Center(
                            child: Text('Adicione Todos'),
                          );
                        } else if (state is LoadingTodoState) {
                          return const CircularProgressIndicator();
                        }
                        return const Center(
                          child: Text('Error'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
