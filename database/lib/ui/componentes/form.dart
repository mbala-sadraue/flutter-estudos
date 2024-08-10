import 'package:database/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Formulario extends StatelessWidget {
  Formulario({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final userController = Get.put(UserController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
               Column(
                children: [
                 const   CircleAvatar(
                    backgroundColor: Colors.grey,
                    maxRadius: 40,
                  ),
                  TextButton(onPressed: (){}, child: const  Text("Adicionar imagem"))
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text("Nome")),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "O campo nome é obrigatorio";
                  }
                  return null;
                },
                controller: nameController,
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text("Telefone")),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "O compo telefone é obrigatório";
                  }
                },
                controller: phoneController,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    userController.userCreate(
                        nameController.text, phoneController.text);
                    nameController.clear();
                    phoneController.clear();
                  }
                },
                child: const Text("cadastrar"),
              )
            ],
          )),
    );
  }
}
