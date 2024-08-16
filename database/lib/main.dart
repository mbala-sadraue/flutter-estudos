import 'package:database/controllers/user_bloc_controller.dart';
import 'package:database/controllers/user_controller.dart';
import 'package:database/ui/componentes/form.dart';
import 'package:database/ui/componentes/list_users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Formulario

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: BindingsBuilder(() {
          Get.put(UserController());
        }),
        home:  HomePage(title: "Lista"));
  }
}

class HomePage extends StatelessWidget {
  final String title;
   HomePage({super.key, required this.title});
  final UserBloc userBloc =  UserBloc();


  void showModalBottomSheet_(BuildContext context) {
    // showModalBottomSheet(
    //     context: context,
    //     builder: (_) {
    //       return Container(
    //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    //         child: Formulario(),
    //       );
          
    //     });

    showDialog(context: context, builder: (_){
      return AlertDialog(
        scrollable: true,
        clipBehavior: Clip.none,
        shape: Border.all(width: 1, color: Colors.white),
        title: const Center(child: Text("Cadastrar usuario",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),),
        content:  Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Formulario(),
          ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child:ListUsers(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet_(context);
          //  userBloc.addUser(1);
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.green,
        ),
      ),
    );
  }
}
