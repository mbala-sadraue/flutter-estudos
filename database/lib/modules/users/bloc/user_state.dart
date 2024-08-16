import 'package:database/models/user.dart';

abstract class UserState {}

// ESTADO INICIAL
class UserInitial extends UserState{}

// PROCESSANDO
class UserLoadInProgress extends UserState{}

// QUANDO TERMINAR DE PROCESSAR
class UserLoadSuccess extends UserState{
  final List<User> users;
  UserLoadSuccess({required this.users});
}

// QUANDO FALHAR 
class UserLoadFailure{
  final Exception exception;
  UserLoadFailure({required this.exception});
}

