// class TarefaBloc <TarefaEvent,TarefaState>{}

import 'dart:async';

import 'package:fluxo/modules/tarefas/bloc/tarefa_event.dart';
import 'package:fluxo/modules/tarefas/bloc/tarefa_sate.dart';
import 'package:fluxo/modules/tarefas/modules/tarefa.dart';
import 'package:fluxo/modules/tarefas/respositories/tarefa_repository.dart';

class TarefaBloc {
  final StreamController<TarefaEvent> _inputTarefaController =
      StreamController<TarefaEvent>();
  final StreamController<TarefaState> _outputTarefaController =
      StreamController<TarefaState>();
  final tarefaRepository = TarefaRepository();

  Sink get inputTarefa => _inputTarefaController.sink;
  Stream<TarefaState> get tarefaState => _outputTarefaController.stream;
  TarefaBloc() {
    _inputTarefaController.stream.listen(_mapEventTOState);
  }

  void _mapEventTOState(TarefaEvent event) async {
    List<Tarefa> tarefas = [];

    _outputTarefaController.add(TarefaLoadingState());
    if (event is GetTarefas) {
      tarefas = await tarefaRepository.getTarefa;
    } else if (event is PostTarefa) {
      tarefas = await tarefaRepository.postTarefa(event.tarefa);
    } else if (event is DeteleTarefa) {
      await tarefaRepository.deteleTarefa(event.tarefa);
    }

    _outputTarefaController.add(TarefaLoaded(tarefas: tarefas));
  }
}
