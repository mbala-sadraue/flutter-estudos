import 'package:banco_fogo/modules/login_for_number/ui/components/opt_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthServiceController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var userIsAuthenticated = false.obs;
  final Rx<User?> _firebaseUser = Rx<User?>(null);
  Rx<String?> verificationId_ = Rx<String?>(null);

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
  signForNUmber(String number){
    _auth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (phoneAuthCredential) {
        print("Complentado ${phoneAuthCredential.toString()}");
      },
      verificationFailed: (error) {
        print("Erro => ${error.toString()}");
      },
      codeSent: (verificationId, forceResendingToken) {
        verificationId_.value = verificationId;
        Get.to(() => OptForm(verificationId: verificationId,));
      }, 
      codeAutoRetrievalTimeout: (verificationId) {
        print("codeAutoRetrievalTimeout dois $verificationId");
      },);
  //  _auth.signInWithPhoneNumber(number); 
  }

    void verifyCode(String code,String verificationId ) async{

    try{

      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);

      await _auth.signInWithCredential(credential);
      
    }catch(e){

      print(e);
    }
  }

}
