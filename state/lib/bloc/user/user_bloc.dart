import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state/bloc/user/user.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserGetUsersEvent>(_onGetUsers);
  }

  _onGetUsers(UserGetUsersEvent event, Emitter emit) async {
    Future.delayed(const Duration(seconds: 1));

    final List<User> users = List.generate(event.count,
        (index) => User(id: index.toString(), name: "user name $index"));

    emit(UserLoadSuccess(users: users));
  }
}
