
import 'package:banco_fogo/modules/chat/messages/models/message_model.dart';

abstract class MessageEvent {}

class FetchMessageData  extends MessageEvent{}

class MessageAdd extends MessageEvent{

  final Message message;
  MessageAdd({required this.message});

}

class MessageUpdate extends MessageEvent{
  final Message message;
  MessageUpdate({ required this.message  });
}

