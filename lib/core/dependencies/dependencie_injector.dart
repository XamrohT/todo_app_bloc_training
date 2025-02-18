import 'package:get_it/get_it.dart';
import 'package:todo_app_bloc/feature/data/data_source/todo_remote_datasource.dart';
import 'package:todo_app_bloc/feature/data/repositories/todo_repository.dart';
import 'package:todo_app_bloc/feature/domain/repositories/i_todo_repository.dart';
import 'package:todo_app_bloc/feature/domain/usecases/create_new_todo_use_case.dart';
import 'package:todo_app_bloc/feature/domain/usecases/get_all_todos_use_case.dart';
import 'package:todo_app_bloc/feature/domain/usecases/remove_todo_use_case.dart';
import 'package:todo_app_bloc/feature/presenter/cubit/todo_filter_cubit.dart';

final GetIt getIt = GetIt.instance;

setupDependencies() async {
  await getItRegister();
}

getItRegister() {
  //datasources
  getIt.registerLazySingleton<TodoRemoteRemoteDatasource>(
      () => TodoRemoteRemoteDatasource());

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
