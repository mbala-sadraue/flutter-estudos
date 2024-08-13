
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePageTask extends StatelessWidget{


    final String title; 
    const HomePageTask(this.title,{super.key});

    @override 
    Widget build(BuildContext context){


      return Scaffold(

          appBar: AppBar(
            title:  Center(child: Text(title),),
          ),

          body: Text("Lista de Tarefas"),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){},
          ),
      );

    }


}