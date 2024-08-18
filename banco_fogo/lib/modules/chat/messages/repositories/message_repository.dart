import 'package:banco_fogo/modules/chat/messages/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageRepository{


  static  Future<void > create(Message message)async {
      final value = message.toJson();

    try{
    CollectionReference instance = FirebaseFirestore.instance.collection('messages');
   
      await instance.doc().set(value);

    }catch (e) {
      print(" Erro ao envia mensagem $e");
    }

  }
}