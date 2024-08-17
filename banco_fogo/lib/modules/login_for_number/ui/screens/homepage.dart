 import 'package:banco_fogo/shered/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
   Homepage({super.key});
  final authUser = Get.put(AuthServiceController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 39, 99),
        title: const Center(child: Text("Bem vindo",style: TextStyle(color: Colors.white),),),
        actions: const [
      ],),
      body: Center(child: Obx(() => Text(authUser.user?.phoneNumber??'')),),
    );
  }
}