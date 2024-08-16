import 'dart:io';
import 'package:database/controllers/user_controller.dart';
import 'package:database/modules/users/bloc/user_bloc.dart';
import 'package:database/modules/users/bloc/user_event.dart';
import 'package:database/modules/users/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListUsers extends StatelessWidget {
   ListUsers({super.key}){
   
   }

  final userController = Get.put(UserController());
  final userBloc = UserBloc();

  @override
  Widget build(BuildContext context) {
     userBloc.inputUser.add(UserGet());
    return StreamBuilder<UserState>(
      stream: userBloc.userState,
      builder: (context , snapshot) {
        if(snapshot.data is UserLoadInProgress){
          return const  Center(
            child: RefreshProgressIndicator(),
          );
        }else if(snapshot.data  is UserLoadSuccess ){

        

            var users = snapshot.data?.users ?? [];  
      return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
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
                         userController.deleteUser(users[index].id!);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                ],
              ),
            );
          });
          }else{
            // return CircularProgressIndicator(color: Colors.red,);
            return const Center(child:  Text("Erro na aplicação",style: TextStyle(color: Colors.red, fontSize: 25),));
          }
    });
  }
}

