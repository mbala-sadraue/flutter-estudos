
import 'package:database/models/user.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';

class UserController extends GetxController {

 static UserController get to => Get.find();


  void userCreate(name, phone){

    final User  user = User(name: name, phone: phone);

    print("Nome:${user.name} - phone: ${user.phone}");

    
  }
}