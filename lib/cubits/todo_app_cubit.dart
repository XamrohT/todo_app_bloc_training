import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_app_state.dart';

class TodoAppCubit extends Cubit<TodoAppState> {
  TodoAppCubit() : super(TodoAppInitial());
}
