// ignore_for_file: prefer_const_constructors

import 'package:banco_fogo/modules/users/controlles/form_login_controller.dart';
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
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 12, 39, 99),
        title: Center(
          child: Obx(() => TextButton(
                onPressed: () {},
                child: Text(formController.title.value,style:TextStyle(color: Colors.white)),
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                     Obx(
                      () => formController.isLogin.value == false?
                       Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Nome'),
                          controller: formController.name ,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Nome é um campo obrigatório";
                            }
                            return null;
                          },
                        ),
                      )
                      
                      
                      :SizedBox()
                     ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'e-mail'),
                            controller: formController.email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "E-mail é um campo obrigatório";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(), labelText: 'Senha'),
                              controller: formController.senha,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "senha é um campo obrigatório";
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
                                  if(!formController.isLogin.value){
                                    authServiceController.sigin(formController.email.text, formController.senha.text);
                                  }else{
                                    authServiceController.sigin(formController.email.text, formController.senha.text);

                                  }
                                },
                                child: Obx(() => Text(
                                      formController.btnEntar.value,
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12.0),
                        child: Obx(() => TextButton(
                              onPressed: () {
                                formController.checkIsLogin();
                              },
                              child: Text(formController.btnStateConta.value),
                            )),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
