

import 'package:banco_fogo/modules/chat/messages/models/message_model.dart';

abstract class MessageState {
  final List<Message> messages;

  MessageState({required this.messages});
}

class MessageInitial extends MessageState {
  MessageInitial() : super(messages: []);
}

class MessageLoadIngProgress extends MessageState{
  MessageLoadIngProgress() : super(messages: []);
}

class MessageLoadSuccess extends MessageState{
  MessageLoadSuccess({required messages}) : super(messages: []);
}


class MessageLoadFailure extends  MessageState{
  final Exception exception;
  MessageLoadFailure({required this.exception }) : super(messages: []);
}


