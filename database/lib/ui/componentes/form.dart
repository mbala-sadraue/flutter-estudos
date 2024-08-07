import 'package:flutter/material.dart';

class Formulario extends StatelessWidget {
 Formulario({super.key});


  final  TextEditingController nomeController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            label: Text("Nome")
          ),
          controller:nomeController ,
        ),
         TextField(
          decoration: const InputDecoration(
            label: Text("Telefone")
          ),
          controller:telefoneController ,
        ),
        ElevatedButton(onPressed: () {
          print("Nome:${nomeController.text}");
        }, child:  Text("cadastrar"))
      ],
    );
  }

  

}
