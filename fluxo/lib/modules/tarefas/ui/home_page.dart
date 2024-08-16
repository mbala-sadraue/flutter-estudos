// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluxo/modules/tarefas/bloc/tarefa_bloc.dart';
import 'package:fluxo/modules/tarefas/bloc/tarefa_event.dart';
import 'package:fluxo/modules/tarefas/bloc/tarefa_sate.dart';
import 'package:fluxo/modules/tarefas/modules/tarefa.dart';

class HomePageTask extends StatelessWidget {
  final String title;
  late final TarefaBloc tarefaBloc;
  HomePageTask(this.title, {super.key}) {
    tarefaBloc = TarefaBloc();

    tarefaBloc.inputTarefa.add(GetTarefas());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
          child: Text(title),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<TarefaState>(
                stream: tarefaBloc.tarefaState,
                builder: (context, state) {
                  if (state .data is TarefaLoadingState) {
                    print("Entruiu");
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.data is TarefaLoaded) {

                    final List terefas =  state.data?.tarefas ?? [];
                    return ListView.builder(
                        itemCount:terefas.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(terefas[index].nome[0]),
                            ),
                            title: Text("Tarefa ${terefas[index].nome}"),
                          );
                        });
                  }
                  else{

                    print(state);

                    return Text("Errro");
                  }
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          tarefaBloc.inputTarefa.add(PostTarefa(tarefa: Tarefa("Caminhar")));
        },
      ),
    );
  }
}
