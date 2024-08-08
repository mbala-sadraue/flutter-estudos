
import 'package:database/models/user.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:database/database/local/database/user_database.dart';
class UserController extends GetxController {

 static UserController get to => Get.find();


  void userCreate(name, phone)async {

    final User  user = User(name: name, phone: phone);

   final respo = await UserDatabase.userCreate(user);

    print("value $respo");
    readAllUser();

    
  }

  void readAllUser() async{

    final users = await  UserDatabase.readAll();

    for(var user in users){

      print("Nome: ${user.name}");
    }

  }
}