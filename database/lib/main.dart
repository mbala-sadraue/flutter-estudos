import 'package:database/ui/componentes/form.dart';
import 'package:flutter/material.dart';



void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{

  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(title: "Lista") ,
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
      body:  Center(
        child: Column(
          children: [
            const Text("Lista"),
            Formulario()
          ],
        ),
      ),
    );
  }
}