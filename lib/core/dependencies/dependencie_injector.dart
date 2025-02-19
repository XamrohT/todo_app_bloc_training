import 'package:get_it/get_it.dart';
import 'package:todo_app_bloc/core/database/database_helper.dart';
import 'package:todo_app_bloc/feature/todos/data/data_source/todo_remote_datasource.dart';
import 'package:todo_app_bloc/feature/todos/data/repositories/todo_repository.dart';
import 'package:todo_app_bloc/feature/todos/domain/repositories/i_todo_repository.dart';
import 'package:todo_app_bloc/feature/todos/domain/usecases/create_new_todo_use_case.dart';
import 'package:todo_app_bloc/feature/todos/domain/usecases/get_all_todos_use_case.dart';
import 'package:todo_app_bloc/feature/todos/domain/usecases/remove_todo_use_case.dart';
import 'package:todo_app_bloc/feature/todos/presenter/cubit/todo_filter_cubit.dart';

final GetIt getIt = GetIt.instance;

setupDependencies() async {
  await getItRegister();
}

getItRegister() {
  //datasources
  getIt.registerLazySingleton<TodoRemoteRemoteDatasource>(
    () => TodoRemoteDatasourceImplementation(
      DatabaseHelper(),
    ),
  );

  //repositories
  getIt.registerLazySingleton<ITodoRepository>(
      () => TodoRepository(getIt<TodoRemoteRemoteDatasource>()));

  //usecases
  getIt.registerSingleton<CreateNewTodoUseCase>(
    CreateNewTodoUseCase(
      getIt<ITodoRepository>(),
    ),
  );
  getIt.registerSingleton<GetAllTodosUseCase>(
    GetAllTodosUseCase(
      getIt<ITodoRepository>(),
    ),
  );
  getIt.registerSingleton<RemoveTodoUseCase>(
    RemoveTodoUseCase(
      getIt<ITodoRepository>(),
    ),
  );
  //cubit
  getIt.registerSingleton<TodoCubit>(
    TodoCubit(
      createNewTodoUseCase: getIt<CreateNewTodoUseCase>(),
      getAllTodosUseCase: getIt<GetAllTodosUseCase>(),
      removeTodoUseCase: getIt<RemoveTodoUseCase>(),
    ),
  );
}
