// ignore_for_file: prefer_const_constructors

import 'package:banco_fogo/modules/login_for_number/controlles/form_login_controller.dart';
import 'package:banco_fogo/shered/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Formulario extends StatelessWidget {
  Formulario({super.key});
  final _formKey = GlobalKey<FormState>();
  final formController = Get.put(FormLoginController());
  final authServiceController = Get.put(AuthServiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Numero de Telefone'),
                          controller: formController.senha,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
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
                              
                                  }
                                },
                                child: Obx(() => Text(
                                      formController.btnEntar.value,
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            ],
                          )),

                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
