

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/custom_views/RFInputText2.dart';
import 'package:flutter_chat/src/home_views/HomeView.dart';
import 'package:flutter_chat/src/home_views/OnBoardingView.dart';
import 'package:flutter_chat/src/login_views/LoginView2.dart';
import 'package:flutter_chat/src/login_views/RegisterView2.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home_views/HomeView2.dart';
import 'login_views/RegisterView.dart';

class App2 extends StatelessWidget{
  App2({Key? key}) : super(key:key);
  FirebaseFirestore db = FirebaseFirestore.instance;

  String isUserLogged(){
    //FirebaseAuth.instance.signOut();
    if(FirebaseAuth.instance.currentUser==null){
      return "/Login";
    }
    else{
      //print("------>>>>> "+FirebaseAuth.instance.currentUser!.email!);
      Fluttertoast.showToast(
          msg: "BIENVENIDO A LA APP "+FirebaseAuth.instance.currentUser!.email!,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 20.0
      );

      return "/OnBoarding";

    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: isUserLogged(),
      routes: {
        '/Login':(context) => LoginView2(),
        '/Registro':(context) => RegisterView(),
        '/Home':(context) => HomeView2(),
        '/OnBoarding':(context) => OnBoardingView(),
      },
    );
  }

}