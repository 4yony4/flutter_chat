import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/App.dart';
import 'package:flutter_chat/src/App2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_chat/src/login_views/LoginView2.dart';
import 'package:flutter_chat/src/singleton/DataHolder.dart';

import 'firebase_options.dart';

void main() async{



  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /*FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });*/

  runApp(
        App2()
  );
}
