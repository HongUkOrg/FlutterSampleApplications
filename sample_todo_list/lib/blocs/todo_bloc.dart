import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sampletodolist/models/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {



  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
