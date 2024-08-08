import 'package:database/controllers/user_controller.dart';
import 'package:database/ui/componentes/form.dart';
import 'package:database/ui/componentes/list_users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

// Formulario

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{

  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      initialBinding: BindingsBuilder(
        (){
          Get.put(UserController());
        }
      ),
      home: const HomePage(title: "Lista")
    );
  }
}

class HomePage extends StatelessWidget{

    final String title;
   const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:   Column(
        children: [
        const SizedBox(
        width:double.infinity,
        height: 230,
        child: ListUsers(),
      ),
      Formulario()
        ],
      ),
    );
  }
}