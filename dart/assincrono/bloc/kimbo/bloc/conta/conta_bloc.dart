// ignore_for_file: unused_element

import 'dart:async';

import '../../models/conta.dart';
import '../../repositories/conta_repository.dart';
import 'conta_event.dart';
import 'conta_state.dart';

class ContaBloc{
  
  final StreamController<ContaEvent> _inputContaEvent = StreamController<ContaEvent>();
  final StreamController<ContaState> _outputContaState  = StreamController<ContaState>.broadcast();

  Sink<ContaEvent> get contaInput =>  _inputContaEvent.sink;
  Stream<ContaState> get contaState => _outputContaState.stream;

  ContaBloc(){
    _inputContaEvent.stream.listen(_mapInputToState);
  }
  void _mapInputToState(ContaEvent event)async {

    final ContaRepository contaRepository = ContaRepository();
     Conta conta; 
     _outputContaState.add(ContaLoading());
    if(event is CreateConta){
       conta =  await contaRepository.createConta(event.conta);
     _outputContaState.add(ContaLoaded(conta: conta));
    }
    else if (event is UpdateConta){
      print("Editar a conta");
    }
    else if (event is DeleteConta){
       conta =  await contaRepository.deleteConta(event.conta);
     _outputContaState.add(ContaLoaded(conta: conta));;
    }
    else{
       conta =  await contaRepository.getConta;
     _outputContaState.add(ContaLoaded(conta: conta));
      print("Mostar a minha conta");
      
    }
    
  }
  // void n(){
  //      ContaRepository contaRepository = ContaRepository();
  //    Conta conta; 
  //   conta =  contaRepository.getConta;
  // }

}