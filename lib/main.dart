import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/cubits/cubit/todo_filter_cubit.dart';
import 'package:todo_app_bloc/pages/home_page/todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:  (_)=>TodoStateCubit(),
      child: MaterialApp(
          title: 'TODO',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true, primarySwatch: Colors.blue),
          home: const TodosPage(),
        ),
    );
  }
}
