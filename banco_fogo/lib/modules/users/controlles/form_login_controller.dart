import 'package:get/get.dart';

class FormLoginController extends GetxController {
  // static FormLoginController get to => Get.find();

  Rx<String> title = 'Seja bem vindo'.obs;
  Rx<String> btnEntar = 'Fazer login'.obs;
  Rx<String> btnStateConta = 'Ainda não tem conta? cadastre-se'.obs;
  Rx<bool> _isLogin = true.obs;

  void checkIsLogin() {
    if (_isLogin.value == true) {
      title.value = 'Seja bem vindo';
      btnEntar.value = 'Fazer login';
      btnStateConta.value = 'Ainda não tem conta? cadastre-se"';
      _isLogin.value = false;
    }else{
       title.value = 'Criar um conta';
      btnEntar.value = 'Cadastre-se';
      btnStateConta.value = 'Já tens uma conta? Faça login"';
      _isLogin.value = true;
    }
  }
}
