import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state/bloc/user/user.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserGetUsersEvent>(_onGetUsers);
    on<UserGetUsersJobsEvent>(_onGetJobs);
  }

  _onGetUsers(UserGetUsersEvent event, Emitter<UserState> emit) async {
      emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));

    final List<User> users = List.generate(event.count,
        (index) => User(id: index.toString(), name: "user name $index"));

    // emit(UserLoadSuccess(users: users));
    emit(state.copyWith(isLoading: false,users: users));
  }
  _onGetJobs(UserGetUsersJobsEvent event, Emitter<UserState> emit) async {
      emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));

    final List<Job> jobs = List.generate(event.count,
        (index) => Job(id: index.toString(), name: "job name $index"));

    // emit(UserLoadSuccess(users: users));
    emit(state.copyWith(isLoading: false,jobs: jobs));
  }



  //  _onGetUsers(UserGetUsersEvent event, Emitter<UserState> emit) async {
  //     emit(UserLoadInProgress());
  //   await Future.delayed(const Duration(seconds: 1));

  //   final List<User> users = List.generate(event.count,
  //       (index) => User(id: index.toString(), name: "user name $index"));

  //   emit(UserLoadSuccess(users: users));
  // }
}
