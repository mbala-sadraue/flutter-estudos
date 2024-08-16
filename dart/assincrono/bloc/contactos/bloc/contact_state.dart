import '../models/contact.dart';

abstract class ContactState {
  final List<Contact> contacts;

  ContactState({required this.contacts});
}

// QUANDO INICIAL
class ContactInitialState extends ContactState {
  ContactInitialState() : super(contacts: []);
}

// QUANDO ESTIVER A PROCESSAR
class ContactLoading extends ContactState {
  ContactLoading() : super(contacts: []);
}

// QUANDO TERMINAR DE PROCESSAR
class ContactLoaded extends ContactState {
  ContactLoaded() : super(contacts: []);
}

// QUANDO TIVER UM ERRO
class ContactError extends ContactState {
  final Exception exception;
  ContactError({required this.exception}) : super(contacts: []);
}
