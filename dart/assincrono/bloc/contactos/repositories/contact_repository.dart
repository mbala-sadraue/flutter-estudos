import 'dart:async';
import '../models/contact.dart';
class ContactRepository{
  int seconds = 5;
 List<Contact> _contacts = [];

Future<List<Contact>> get getContacts async{
  return Future.delayed(
    Duration(seconds: seconds),
    () => _contacts

  );
}

Future<List<Contact>> postContact(Contact contact) async{
  _contacts.add(contact);

  return Future.delayed(
    Duration(seconds: seconds),
    () => _contacts
  );
}

Future<List<Contact>>  detele(Contact contact){

  _contacts.remove(contact);

  return Future.delayed(
    Duration(seconds: seconds),
    () => _contacts
  );
} 


}