
import 'dart:io';

import 'package:database/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Formulario extends StatelessWidget {
  Formulario({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final userController = Get.put(UserController());
  final imagePickerController = Get.put(ImagePickerController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
               GetBuilder<ImagePickerController>(builder: (_){ 

                // final bgImagemOrBgColor  = _.imagem ==null?backgroundColor: Colors.grey;
                
                return   Column(
                children: [
                    CircleAvatar(
                  backgroundImage:_.imagem != null? FileImage(File(_.imagem!.path)):null,
                   
                    maxRadius: 40,
                  ),
                  TextButton(onPressed: (){
                     imagePickerController.pickerImagem_();

                  }, child: const  Text("Adicionar imagem"))
                ],
              );}),
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
                  return null;
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
                        nameController.text, phoneController.text,imagePickerController.imagem);
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

class ImagePickerController extends GetxController{

 static ImagePickerController get to  => Get.find();
  
  XFile?  imagem;
  Future<XFile?> pickerImagem_() async{


    final imagePicker = ImagePicker();
    final pickedImagem = await imagePicker.pickImage(source: ImageSource.gallery);
    imagem = pickedImagem;
     update();
     return pickedImagem;
  }

}
