import 'package:banco_fogo/modules/users/ui/components/form.dart';
import 'package:banco_fogo/modules/users/ui/screens/homepage.dart';
import 'package:flutter/material.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});
  final bool userIsAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    return userIsAuthenticated == true ?const  Homepage() : Formulario();
  }
}
