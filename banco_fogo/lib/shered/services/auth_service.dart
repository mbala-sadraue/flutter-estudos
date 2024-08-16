import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthServiceController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var userIsAuthenticated = false.obs;
  final Rx<User?> _firebaseUser = Rx<User?>(null);

  User? get user => _firebaseUser.value;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());

    ever(_firebaseUser, (user) {
      if (user != null) {
        userIsAuthenticated.value = true;
      } else {
        userIsAuthenticated.value = false;
      }
    });
  }

  showSnack(String title, String error) {
   Get.snackbar(
      'Snackbar',
      'This is a snackbar',
      snackPosition: SnackPosition.BOTTOM,
      forwardAnimationCurve: Curves.elasticInOut,
      reverseAnimationCurve: Curves.easeOut,
    );
  }

  createUser(String email,String password)async {
    try{

      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      
      
    }catch( e){
      showSnack("Erro ao criar usuario", e.toString());
    }
  }
  sigin(String email,String password)async {
    try{

      await _auth.signInWithEmailAndPassword(email: email, password: password);
      
      
    }catch( e){
      showSnack("Erro logar", e.toString());
    }
  }

  logout()async {
    try{

      await _auth.signOut();
      
    }catch( e){
      showSnack("Erro ao ao", e.toString());
    }
  }
}
