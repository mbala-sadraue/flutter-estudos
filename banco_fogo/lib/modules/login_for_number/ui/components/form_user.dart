// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:banco_fogo/modules/chat/messages/bloc/message_bloc.dart';
import 'package:banco_fogo/modules/chat/messages/bloc/message_event.dart';
import 'package:banco_fogo/modules/chat/messages/bloc/message_state.dart';
import 'package:banco_fogo/modules/chat/messages/models/message_model.dart';
import 'package:banco_fogo/modules/login_for_number/controlles/form_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormUser extends StatelessWidget {
  final messageBloc = MessageBloc(); 
   FormUser({super.key}){
      messageBloc.inputMessage.add(FetchMessageData());
   }
  final _formKey = GlobalKey<FormState>();
  final formController = Get.put(FormUserController());
  // final authServiceController = Get.put(AuthServiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back,color: Colors.white,),),
        backgroundColor: const Color.fromARGB(255, 12, 39, 99),
        title: const Center(child: Text("Adicionar outros dados",style: TextStyle(color: Colors.white,fontSize: 16,), textAlign: TextAlign.center,),),
       ),
        body: Center(
      child:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                 GetBuilder<FormUserController>(builder: (_){ 
          
                  // final bgImagemOrBgColor  = _.imagem ==null?backgroundColor: Colors.grey;
                  
                  return   Column(
                  children: [
                      CircleAvatar(
                    backgroundImage:_.imagem != null? FileImage(File(_.imagem!.path)):null,
                     
                      maxRadius: 40,
                    ),
                    TextButton(onPressed: (){
                       formController.pickerImagem_();
          
                    }, child: const  Text("Adicionar imagem"))
                  ],
                );}),
                TextFormField(
                  decoration: const InputDecoration(label: Text("Nome")),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "O campo nome é obrigatorio";
                    }
                    return null;
                  },
                  controller: formController.name,
                ),
                TextFormField(
                  decoration: const InputDecoration(label: Text("Telefone")),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "O compo telefone é obrigatório";
                    }
                    return null;
                  },
                  controller: formController.photo,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                   messageBloc.inputMessage.add(MessageAdd(message: Message( userId: "userI", text: "Mama estou bem", recipientId: "33i4u", createdAt: DateTime.now())));
                    print("object 232");
                  },
                  child: const Text("cadastrar"),
                )
              ],
            )),
        ),
      ),
    ),
    );
  }
}