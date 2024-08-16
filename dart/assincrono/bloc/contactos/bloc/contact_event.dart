import '../models/contact.dart';

abstract class ContactEvent {

}

// PEGAR TODOS OS CONTACTOS
class GetContact extends ContactEvent {}

// CRIAR CONTACTO
class PostContact extends ContactEvent {
  
   final Contact  contact;
  
  PostContact({
    required this.contact
  });
}

// AUALIZAR CONTACTO
class UpdateContact extends ContactEvent {

  final Contact contact;

  UpdateContact({
    required this.contact
  });
}

// APAGAR CONTACTO
class DeleteContanct extends ContactEvent {
  final Contact contact;
  DeleteContanct({
    required this.contact
  });
}
