abstract class ContactState{}

// QUANDO INICIAL
class ContactInitialState extends ContactState {}

// QUANDO ESTIVER A PROCESSAR
class ContactLoading extends ContactState {}

// QUANDO TERMINAR DE PROCESSAR
class ContactLoaded extends ContactState {}

// QUANDO TIVER UM ERRO
class ContactError  extends ContactState {
 final Exception exception;
  ContactError({required this.exception});
}