import 'package:banco_fogo/modules/chat/users/models/user_model.dart';

abstract class UserEvent {}

class FetchUserData  extends UserEvent{}

class UserAdd extends UserEvent{

  final UserModel user;
  UserAdd({required this.user});

}

class UserUpdate extends UserEvent{
  final UserModel user;
  UserUpdate({ required this.user  });
}

