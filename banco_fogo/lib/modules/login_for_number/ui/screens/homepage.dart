 // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

 import 'package:banco_fogo/modules/login_for_number/ui/components/form_user.dart';
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
        actions:  [

          PopupMenuButton (
            child: Icon(Icons.more_vert_rounded,color: Colors.white,),
            itemBuilder: (context) => <PopupMenuEntry>[

              PopupMenuItem(
                onTap: (){
                  Get.to( () => FormUser());
                },
                child: Row(
                children: [Icon(Icons.settings), Text("Definição")],
              ))
            ],
          )
      ],),
      body: Center(child: Obx(() => Text(authUser.user?.phoneNumber??'')),),
    );
  }
}