import 'dart:async';

import 'contact_event.dart';
import 'contact_state.dart';

class ContactBloc{

  final StreamController<ContactEvent> _inputContactController  = StreamController<ContactEvent>();
  final StreamController<ContactState> _outputContactController = StreamController<ContactState>();

  Sink<ContactEvent> get inputContact {
    return _inputContactController.sink;
  }
  Stream<ContactState> get contactState{
    return _outputContactController.stream;
  }
  ContactBloc(){
    _inputContactController.stream.listen(_mapEventToState);
  }

 void _mapEventToState(ContactEvent event){

  _outputContactController.add(ContactLoading());

  if(event is UpdateContact){
    print("Atualizar o contaco"); 
  }
  else if (event is PostContact){
    print("Criar o contacto");
  }else if (event is DeleteContanct){
    print("Apagar o contacto");

  }else{
    print(event);
     print("get All contaco"); 
  }
    _outputContactController.add(ContactLoaded());
  }



}

