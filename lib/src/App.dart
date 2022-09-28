
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/custom_views/NameBox.dart';
import 'package:flutter_chat/src/home_views/HomeView.dart';
import 'package:flutter_chat/src/login_views/LoginPhoneView.dart';
import 'package:flutter_chat/src/login_views/LoginView.dart';
import 'package:flutter_chat/src/login_views/RegisterView.dart';

class App extends StatelessWidget{

  const App({Key? key}) : super(key:key);

  String getInitalRoute(){
    if(FirebaseAuth.instance.currentUser==null){
      return '/loginphoneview';
    }
    else{
      return '/home';
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //throw UnimplementedError();
    return MaterialApp(
      title: 'Chatdar',
      initialRoute: getInitalRoute(),
      routes: {
        '/home':(context) => HomeView(),
        '/loginphoneview':(context) => LoginPhoneView(),
        '/loginview':(context) => const LoginView(),
        '/registerview':(context) => RegisterView(),
      },
    );
  }

}