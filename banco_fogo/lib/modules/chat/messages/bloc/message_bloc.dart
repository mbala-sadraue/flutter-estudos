import 'dart:async';

import 'package:banco_fogo/modules/chat/messages/bloc/message_event.dart';
import 'package:banco_fogo/modules/chat/messages/bloc/message_state.dart';
import 'package:banco_fogo/modules/chat/messages/models/message_model.dart';

import '../repositories/message_repository.dart';

class MessageBloc{

  final StreamController<MessageEvent> _inputMessageController = StreamController<MessageEvent>();
  final StreamController<MessageState> _outputMessageController = StreamController<MessageState>();

  Sink<MessageEvent> get inputMessage =>  _inputMessageController.sink;
  Stream <MessageState> get messageState => _outputMessageController.stream;
  

  MessageBloc(){
    print("object");
      _inputMessageController.stream.listen(_mapEventToState);

  }

  _mapEventToState(MessageEvent event)async {
    final List<Message> _messages;
    _outputMessageController.add(MessageLoadIngProgress());
    if(event is MessageAdd){
    print("criação");
       await  MessageRepository.create(event.message);
       await  MessageRepository.getAll();
    }else if (event is MessageUpdate){
      print("update");
    }else{
     _messages =  await  MessageRepository.getAll();
      print(_messages.length);
    }
    _outputMessageController.add(MessageLoadSuccess(messages: []));
  }
}