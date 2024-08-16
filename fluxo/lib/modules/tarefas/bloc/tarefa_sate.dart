import 'package:fluxo/modules/tarefas/modules/tarefa.dart';

abstract  class TarefaState{
  final List<Tarefa> tarefas;
  const TarefaState({ required this.tarefas}); 
}

// QUANDO INICIAR
class TarefaInitialState extends TarefaState{
TarefaInitialState():super(tarefas: []);
}

//  QUANDO ESTIVER A PROCESSAR 
class TarefaLoadingState extends TarefaState{
  TarefaLoadingState():super(tarefas: []);
}

// QUANDO TERMINAR A PROCESSAR 

class TarefaLoaded extends TarefaState{
  const  TarefaLoaded({ required super.tarefas});
}

// QUANDO FALHAR

class TarefaErrorState extends TarefaState{

  final Exception exception;
  TarefaErrorState({required this.exception}):super(tarefas: []);
}