import 'package:database/models/user.dart';

abstract class UserState {
  final List<User> users;
  UserState({required this.users});
  
}

// ESTADO INICIAL
class UserInitial extends UserState{
  UserInitial():super(users: []);
}

// PROCESSANDO
class UserLoadInProgress extends UserState{
  UserLoadInProgress():super(users: []);
}

// QUANDO TERMINAR DE PROCESSAR
class UserLoadSuccess extends UserState{
  final List<User> users;
  UserLoadSuccess({required this.users}):super(users: users);
}

// QUANDO FALHAR 
class UserLoadFailure{
  final Exception exception;
  UserLoadFailure({required this.exception});
}

