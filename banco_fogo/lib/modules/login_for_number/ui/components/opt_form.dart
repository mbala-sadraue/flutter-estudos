// ignore_for_file: prefer_const_constructors

import 'package:banco_fogo/shered/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controlles/form_login_number_controller.dart';

class OptForm extends StatelessWidget {
  OptForm({super.key,required this.verificationId});
  final _formKey = GlobalKey<FormState>();
  final formController = Get.put(FormLoginNumberController());
  final authServiceController = Get.put(AuthServiceController());
  final String verificationId;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      
                      children: [
                          Padding(
                    padding: const EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 12.0),
                  child: Text("Insira o codigo recebido",style: TextStyle(
                    
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign:TextAlign.center ,),
                ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Insera o codigo'),
                            controller: formController.code,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "o Codigo um campo obrigatório";
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
                                      print("object");
                                       authServiceController.verifyCode(formController.code.text.trim(), verificationId);
                                    }
                                  },
                                  child: Text(
                                        'verificar',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                ),
                              ],
                            )),
          
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}