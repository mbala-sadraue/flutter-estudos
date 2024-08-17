// import 'package:banco_fogo/modules/login_for_number/ui/components/form.dart';
import 'package:banco_fogo/modules/login_for_number/ui/components/form_number.dart';
import 'package:banco_fogo/modules/login_for_number/ui/screens/homepage.dart';
import 'package:banco_fogo/shered/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthCheck extends StatelessWidget {
   AuthCheck({super.key});
  final authServiceController = Get.put(AuthServiceController());
  final userIsAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    return Obx(()  { return authServiceController.userIsAuthenticated.value ==true ?  Homepage() : FormularioNumber();});
    //  return userIsAuthenticated ?  Homepage() : FormularioNumber();
  }

}
