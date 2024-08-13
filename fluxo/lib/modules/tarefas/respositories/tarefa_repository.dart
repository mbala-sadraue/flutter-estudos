import 'dart:async';
import '../modules/tarefa.dart';

class TarefaRepository{

  final List<Tarefa> _tarefas  = [];


   TarefaRepository(){
      _tarefas.addAll([
        const Tarefa("Banhar"),
        const Tarefa("Banhar"),
        const Tarefa("Banhar"),
        const Tarefa("Banhar"),
        const Tarefa("Banhar"),
        const Tarefa("Banhar"),
        ]
      );
  }

  Future< List<Tarefa>> get getTarefa async{
    return  Future.delayed( const Duration(seconds: 2),()  => _tarefas );
  }

  Future<List<Tarefa>> postTarefa(Tarefa tarefa){

    return Future.delayed(
     const  Duration(seconds:2 ),
     () => _tarefas
    );
  }

  Future<void> deteleTarefa(Tarefa tarefa)async{

      _tarefas.remove(tarefa);

      Future.delayed(const Duration(seconds: 3), () =>  _tarefas);
    
  }


}