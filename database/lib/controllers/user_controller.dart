
import 'dart:io';

import 'package:get/state_manager.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:database/models/user.dart';
import 'package:database/database/local/database/user_database.dart';
class UserController extends GetxController {
  

 static UserController get to => Get.find();

  List<User> users = [];
  
  @override
  void onInit(){

    readAllUser();
    super.onInit();
  

  }
  
  
  void userCreate(name, phone, image)async {
    String  imagemPath = ''; 
  if (image != null){
    imagemPath = await  saveImage(image);
  }
  final User  user = User(name: name, phone: phone,image: imagemPath);

   final respo = await UserDatabase.userCreate(user);
    readAllUser();
  }
  Future<String> saveImage(File image) async{


      final directory =  await getApplicationDocumentsDirectory();
      final imagePath   =   join(directory.path,'image','${DateTime.now()}.jpg');
      await image.copy(imagePath);
      return imagePath;
      
    }

  void readAllUser() async{

    users = await  UserDatabase.readAll();

    update();

  }

  void updateUser(User user)  async{

  }

  void deleteUser(int id) async{
    await UserDatabase.detele(id);
    readAllUser();
  }
}