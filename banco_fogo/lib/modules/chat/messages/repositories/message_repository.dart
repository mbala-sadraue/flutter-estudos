import 'package:banco_fogo/modules/chat/messages/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageRepository {
  static Future<void> create(Message message) async {
    final value = message.toJson();

    try {
      CollectionReference instance =
          FirebaseFirestore.instance.collection('messages');

     final result =  await instance.doc().set(value);

      print("Cadastrar");
    } catch (e) {
      print(" Erro ao envia mensagem $e");
    }
  }

  static Future<void> getAll() async {
    final messagesCollections =
        FirebaseFirestore.instance.collection('messages');

    try {
      final messages = await messagesCollections.get();
      print("Message $messages");
    } catch (e) {
      print(" Erro ao envia mensagem $e");
    }
  }
}
