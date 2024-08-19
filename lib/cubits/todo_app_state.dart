part of 'todo_app_cubit.dart';

sealed class TodoAppState extends Equatable {
  const TodoAppState();

  @override
  List<Object> get props => [];
}

final class TodoAppInitial extends TodoAppState {}
