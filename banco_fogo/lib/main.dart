import 'package:banco_fogo/config.dart';
import 'package:banco_fogo/modules/users/ui/components/auth_check.dart';
import 'package:banco_fogo/modules/users/ui/components/form.dart';
import 'package:flutter/material.dart';

void main() async {
 await  initConfigurations();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: AuthCheck(),
    );
  }
}