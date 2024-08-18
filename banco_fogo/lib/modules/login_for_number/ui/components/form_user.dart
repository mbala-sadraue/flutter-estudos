// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:banco_fogo/modules/login_for_number/controlles/form_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormUser extends StatelessWidget {
   FormUser({super.key});
  final _formKey = GlobalKey<FormState>();
  final formController = Get.put(FormUserController());
  // final authServiceController = Get.put(AuthServiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    backgroundImage:_.imagem != null? FileImage(File(_.imagem!)):null,
                     
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