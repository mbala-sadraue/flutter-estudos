import 'dart:async';

import 'package:banco_fogo/shered/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> initConfigurations() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const  FirebaseOptions(
          apiKey: "AIzaSyCP1FMBMzbq_h7S4KfAk_Kx3JVOfD1oyLg",
          appId: "1:120777348651:android:3ea7c6fe1642d5df1bbc6e",
          messagingSenderId: "sendid",
          projectId: "primeiro-projecto-29316"));
          Get.lazyPut<AuthServiceController>(() => AuthServiceController());
}
