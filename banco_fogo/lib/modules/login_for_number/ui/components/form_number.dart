// ignore_for_file: prefer_const_constructors

import 'package:banco_fogo/shered/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controlles/form_login_number_controller.dart';

class FormularioNumber extends StatelessWidget {
  FormularioNumber({super.key});
  final _formKey = GlobalKey<FormState>();
  final formController = Get.put(FormLoginNumberController());
  final authServiceController = Get.put(AuthServiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12.0),
                child: Text("Autentica-se  com o teu numero de celular",style: TextStyle(
                  
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
                textAlign:TextAlign.center ,),
              ),
              Form(
                    key: _formKey,
                    child: Column(
                      
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Numero de Telefone'),
                            controller: formController.number,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "o Número é um campo obrigatório";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromARGB(255, 12, 39, 99)),
                                  ),
                                  onPressed: () {
                                    if(_formKey.currentState!.validate()){
                                        authServiceController.signForNUmber(formController.number.text);

                                      // if(authServiceController.verificationId_.value != null){
                                        
                                      // }else
                                
                                    }
                                  },
                                  child: Text(
                                        'Entrar',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                ),
                              ],
                            )),
                        
                      ],
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
