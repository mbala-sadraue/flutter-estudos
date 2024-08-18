import 'dart:async';

import 'package:banco_fogo/modules/chat/messages/bloc/message_event.dart';
import 'package:banco_fogo/modules/chat/messages/bloc/message_state.dart';

import '../repositories/message_repository.dart';

class MessageBloc{

  final StreamController<MessageEvent> _inputMessageController = StreamController<MessageEvent>();
  final StreamController<MessageState> _outputMessageController = StreamController<MessageState>();

  Sink<MessageEvent> get inputMessage =>  _inputMessageController.sink;
  Stream <MessageState> get messageState => _outputMessageController.stream;
  

  MessageBloc(){
      _inputMessageController.stream.listen(_mapEventToState);

  }

  _mapEventToState(MessageEvent event)async {
    _outputMessageController.add(MessageLoadIngProgress());
    if(event is MessageAdd){

    }else if (event is MessageUpdate){
       await  MessageRepository.create(event.message);
    }else{

    }
    _outputMessageController.add(MessageLoadSuccess(messages: []));
  }
}