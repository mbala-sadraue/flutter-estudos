
import 'package:database/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ListUsers extends StatelessWidget{
  const ListUsers({super.key});

  @override
  Widget build(BuildContext context) {
  return GetBuilder<UserController>(
    builder:(_){
      return ListView.builder(
        itemCount: _.users.length,
    itemBuilder: (context,index){
      final user = _.users[index];
      return   ListTile(
        title: Text(user.name),
        subtitle: Text(user.phone),
      );
    }
    );

  } );
  }

}