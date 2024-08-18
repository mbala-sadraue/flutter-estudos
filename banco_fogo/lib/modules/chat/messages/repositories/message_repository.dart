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

  static Future<List<Message>> getAll() async {
    final messagesCollections =
        FirebaseFirestore.instance.collection('messages');

    try {
      final messages = await messagesCollections.get();
      final docs = messages.docs;
      final List<Message> _messages  = [];
   
      for (var item in docs ){
        print(item.data());
        // _messages.add(
        //     Message(
        //       text:item.data()['text'],
        //       recipientId:item.data()['recipientId'],
        //       userId: item.data()['userId'],
        //       createdAt: DateTime.now()
        //     )
        // );
      }

      return _messages;
    } catch (e) {
      return [];
    }
  }
}
