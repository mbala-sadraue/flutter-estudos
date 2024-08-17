import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormLoginNumberController extends GetxController {
 static FormLoginNumberController get to => Get.find();
 final TextEditingController number = TextEditingController();
 final TextEditingController code = TextEditingController();
 final TextEditingController senha = TextEditingController();

  Rx<String> title = 'Seja bem vindo'.obs;
  Rx<String> btnEntar = 'Fazer login'.obs;
  Rx<String> btnStateConta = 'Ainda não tem conta? cadastre-se'.obs;
  Rx<bool> isLogin = true.obs;

  void checkIsLogin() {
    if (isLogin.value == false) {
      title.value = 'Seja bem vindo';
      btnEntar.value = 'Fazer login';
      btnStateConta.value = 'Ainda não tem conta? cadastre-se"';
    }else{
       title.value = 'Criar um conta';
      btnEntar.value = 'Cadastre-se';
      btnStateConta.value = 'Já tens uma conta? Faça login"';
    }
      isLogin.value = !isLogin.value;
  }
}
