

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/custom_views/RFInputText2.dart';
import 'package:flutter_chat/src/home_views/HomeView.dart';
import 'package:flutter_chat/src/login_views/LoginView2.dart';
import 'package:flutter_chat/src/login_views/RegisterView2.dart';

class App2 extends StatelessWidget{
  App2({Key? key}) : super(key:key);

  String isUserLogged(){
    //FirebaseAuth.instance.signOut();
    if(FirebaseAuth.instance.currentUser==null){
      return "/Login";
    }
    else{
      return "/Home";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: isUserLogged(),
      routes: {
        '/Login':(context) => LoginView2(),
        '/Registro':(context) => RegisterView2(),
        '/Home':(context) => HomeView(),
      },
    );
  }

}