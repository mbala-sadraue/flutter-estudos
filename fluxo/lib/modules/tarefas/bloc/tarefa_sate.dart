import 'package:fluxo/modules/tarefas/modules/tarefa.dart';

abstract  class TarefaState{
  final List<Tarefa> tarefas;
  const TarefaState({ required this.tarefas}); 
}

// QUANDOINICIAR
class TarefaInitialState extends TarefaState{
TarefaInitialState():super(tarefas: []);
}

class TarefaLoadingState extends TarefaState{
  TarefaLoadingState():super(tarefas: []);
}

class TarefaLoaded extends TarefaState{
  const  TarefaLoaded({ required super.tarefas});
}

class TarefaErrorState extends TarefaState{

  final Exception exception;
  TarefaErrorState({required this.exception}):super(tarefas: []);
}