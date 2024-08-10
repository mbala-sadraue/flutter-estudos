import 'dart:io';

import 'package:database/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListUsers extends StatelessWidget {
   ListUsers({super.key});

  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (_) {
      return ListView.builder(
          itemCount: _.users.length,
          itemBuilder: (context, index) {
            final user = _.users[index];
            return ListTile(
              leading:  CircleAvatar(
                backgroundImage:user.image != null? FileImage(File(user.image!)):null,
              ),
              title: Text(user.name),
              subtitle: Text(user.phone),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {

                        
                      },
                      icon: const Icon(Icons.edit, color: Colors.orange)),
                  IconButton(
                      onPressed: () {
                         userController.deleteUser(_.users[index].id!);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                ],
              ),
            );
          });
    });
  }
}
