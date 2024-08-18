import 'package:banco_fogo/modules/chat/users/models/user_model.dart';

abstract class UserState {
  final List<UserModel> users;

  UserState({required this.users});
}

class UserInitial extends UserState {
  UserInitial() : super(users: []);
}

class UserLoadIngProgress extends UserState{
  UserLoadIngProgress() : super(users: []);
}

class UserLoadSuccess extends UserState{
  UserLoadSuccess({required users}) : super(users: []);
}


class UserLoadFailure extends  UserState{
  final Exception exception;
  UserLoadFailure({required this.exception }) : super(users: []);
}


