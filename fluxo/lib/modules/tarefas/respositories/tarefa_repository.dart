import 'dart:async';
import '../modules/tarefa.dart';

class TarefaRepository{

  final List<Tarefa> _tarefas  = [];


   TarefaRepository(){
      _tarefas.addAll([
        const Tarefa("Banhar"),
        const Tarefa("Marta"),
        const Tarefa("Paula"),
        const Tarefa("Estefhania"),
        const Tarefa("Luena"),
        const Tarefa("Pompeu"),
        ]
      );
  }

  Future< List<Tarefa>> get getTarefa async{
    return  Future.delayed( const Duration(seconds: 2),()  => _tarefas );
  }

  Future<List<Tarefa>> postTarefa(Tarefa tarefa){

      _tarefas.add(tarefa);
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