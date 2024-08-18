// ignore_for_file: unused_element

import 'dart:io';

import 'package:banco_fogo/shered/services/auth_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FormUserController extends GetxController {
 static FormUserController get to => Get.find();
 final TextEditingController name = TextEditingController();
 final TextEditingController cidade = TextEditingController();
 final TextEditingController photo = TextEditingController();
 final authServiceController = Get.put(AuthServiceController());
//  final String? imagem = '';
XFile? imagem;


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
  createUser() async{
    final nameImage = '${DateTime.now()}.jpg';
  final imgPath = await _uploadUserImagem(File(imagem!.path),nameImage);
   await authServiceController.user!.updatePhotoURL(imgPath);

  }

  pickerImagem_() async {

    final imagePicker = ImagePicker();
    final pickedFile  = await imagePicker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      imagem = pickedFile;
      update();
    }

  }
  Future<String?> _uploadUserImagem(File imagem,String nameImg) async {
    final storage = FirebaseStorage.instance;
  final uid = authServiceController.user!.uid;
    final imgRef = storage.ref().child('user_images').child(uid).child(nameImg);
    imgRef.putFile(imagem).whenComplete((){});
    return await imgRef.getDownloadURL();
  }
}
