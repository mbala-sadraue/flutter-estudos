import 'package:fluxo/modules/tarefas/modules/tarefa.dart';

abstract class TarefaEvent {}

class GetTarefas extends  TarefaEvent{}

class PostTarefa extends TarefaEvent {
  final Tarefa tarefa ;
  PostTarefa({required this.tarefa}):super();
}

class DeteleTarefa extends TarefaEvent {
  final Tarefa tarefa;

  DeteleTarefa({required this.tarefa});
}