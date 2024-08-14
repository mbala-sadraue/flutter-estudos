// ignore_for_file: unused_element

import 'dart:async';

import 'conta_event.dart';
import 'conta_state.dart';

class ContaBloc{
  
  final StreamController<ContaEvent> _inputContaEvent = StreamController<ContaEvent>();
  final StreamController<ContaState> _outputContaEvent  = StreamController<ContaState>();

  Sink<ContaEvent> get contaInput =>  _inputContaEvent.sink;
  Stream<ContaState> get contaState => _outputContaEvent.stream;

  ContaBloc(){
    _inputContaEvent.stream.listen(_mapInputToState);
  }
  void _mapInputToState(ContaEvent event){

    if(event is CreateConta){
      print("Vamos criar uma conta");
    }
    else if (event is UpdateConta){
      print("Editar a conta");
    }
    else if (event is DeleteConta){
      print("Vamos apagar a conta");
    }
    else{
      print("Mostar a minha conta");
      
    }
    
  }

}