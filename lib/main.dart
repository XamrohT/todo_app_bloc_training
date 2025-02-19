import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app_bloc/core/dependencies/dependencie_injector.dart';
import 'package:todo_app_bloc/feature/todos/presenter/view/pages/todo_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodosPage(),
    );
  }
}
