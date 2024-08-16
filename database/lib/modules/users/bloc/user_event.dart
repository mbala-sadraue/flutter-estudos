import 'package:database/models/user.dart';

abstract class UserEvent{}

// PEGAR OS CONTACTOS
class UserGet extends UserEvent{}

// CRIAR NO CONTACTO
class UserAdd extends UserEvent{
  final User user;
  UserAdd({required this.user});
}

//DELETAR CONTACOS
class UserDelete extends UserEvent{
   final User user;
  UserDelete({required this.user});
} 