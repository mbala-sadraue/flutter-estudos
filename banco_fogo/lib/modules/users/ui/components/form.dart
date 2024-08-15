// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Formulario extends StatelessWidget {
 Formulario({super.key});
final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.purple,
      //   title: const Center(child: Text("Fazer "),),
      // ),
      body:   SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding:  EdgeInsets.only(top: 100),
            child: Form(
              key: _formKey,
              child:Column(
                children: [
                  const Text(
                    'Seja bem Vindo',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1.5
          
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 12.0),
                    child: TextFormField(
                                
                      decoration: const InputDecoration(
                        border:OutlineInputBorder(),
                        labelText: 'e-mail'
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value){
                        if(value!.isEmpty){
                          return "E-mail é um campo obrigatório";
                        }
                        return null;
                      },
                      
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 12.0),
                    child: TextFormField(
                                
                      decoration: const InputDecoration(
                        border:OutlineInputBorder(),
                        labelText: 'Senha'
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (value){
                        if(value!.isEmpty){
                          return "senha é um campo obrigatório";
                        }
                        return null;
                      },
                      
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 24.0,vertical: 12.0),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                        onPressed: (){}, 
                        child: const Text("Fazer login", style: TextStyle(color: Colors.white),)),
                      ],
                    )
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 12.0),
                    child:TextButton(onPressed: (){}, child: const Text("Ainda não tem conta? cadastre-se"))
                    ),
                ],
              )
            ),
          ),
        ],),
      ),

    );
  }
}