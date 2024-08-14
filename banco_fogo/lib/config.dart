import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> initConfigurations() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const  FirebaseOptions(
          apiKey: "AIzaSyCP1FMBMzbq_h7S4KfAk_Kx3JVOfD1oyLg",
          appId: "1:120777348651:android:3ea7c6fe1642d5df1bbc6e",
          messagingSenderId: "sendid",
          projectId: "primeiro-projecto-29316"));
}
