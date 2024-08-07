import 'package:database/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Formulario extends StatelessWidget {
 Formulario({super.key});


  final  TextEditingController nameController =TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            label: Text("Nome")
          ),
          controller:nameController , 
             ),
         TextField(
          decoration: const InputDecoration(
            label: Text("Telefone")
          ),
          controller:phoneController ,
        ),
        ElevatedButton(onPressed: () {
         userController.userCreate(nameController.text, phoneController.text);
         nameController.clear();
         phoneController.clear();
        }, child: const  Text("cadastrar"))
      ],
    );
  }

  

}
