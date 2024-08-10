import 'dart:io';

import 'package:get/state_manager.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:database/models/user.dart';
import 'package:database/database/local/database/user_database.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  List<User> users = [];

  @override
  void onInit() {
    readAllUser();
    super.onInit();
  }

  void userCreate(name, phone, XFile? image) async {
    String imagemPath = '';
    if (image != null) {
      imagemPath = await saveImage(File(image.path));
    }
    final User user = User(name: name, phone: phone, image: imagemPath);

    final respo = await UserDatabase.userCreate(user);
    readAllUser();
  }

  Future<dynamic> saveImage(File image) async {
    // if(! await Permission.storage.request().isGranted){
    //   return null;
    // }
    final storegeStatus = await Permission.storage.status;
    if (!storegeStatus.isGranted) {
      await Permission.storage.request();
    }

    final directory = await getApplicationDocumentsDirectory();

    final directoryImage = Directory(join(directory.path, 'image'));

    if (!await directoryImage.exists()) {
      await directoryImage.create();
    }
    final imagePath =
        join(directoryImage.path, '${DateTime.now()}.jpg');
    await image.copy(imagePath);
    return imagePath;
  }

  void readAllUser() async {
    users = await UserDatabase.readAll();

    update();
  }

  void updateUser(User user) async {}

  void deleteUser(int id) async {
    await UserDatabase.detele(id);
    readAllUser();
  }
}
