
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePageTask extends StatelessWidget{


    final String title; 
    const HomePageTask(this.title,{super.key});

    @override 
    Widget build(BuildContext context){


      return Scaffold(

          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title:  Center(child: Text(title),),
          ),

          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context, index){
              
              
                    return ListTile(
                      leading: CircleAvatar(child: Text("$index"),),
                      title: Text("Tarefa $index"),
              
                    );
              
                  }),),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){},
          ),
      );

    }


}