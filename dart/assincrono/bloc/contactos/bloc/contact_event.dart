import '../models/contact.dart';

abstract class ContactEvent {
  final List<Contact> contacts;

  ContactEvent({required this.contacts});
}

// PEGAR TODOS OS CONTACTOS
class GetContact extends ContactEvent {
  GetContact():super(contacts: []);
}

// CRIAR CONTACTO
class PostContact extends ContactEvent {
  
   final Contact  contact;
  
  PostContact({
    required this.contact
  }):super(contacts: []);
}

// AUALIZAR CONTACTO
class UpdateContact extends ContactEvent {

  final Contact contact;

  UpdateContact({
    required this.contact
  }):super(contacts: []);
}

// APAGAR CONTACTO
class DeleteContanct extends ContactEvent {
  final Contact contact;
  DeleteContanct({
    required this.contact
  }):super(contacts: []);
}
