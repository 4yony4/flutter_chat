

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eurekalib/custom_views/YonyView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/custom_views/RFInputText2.dart';
import 'package:flutter_chat/src/home_views/HomeView.dart';
import 'package:flutter_chat/src/home_views/OnBoardingView.dart';
import 'package:flutter_chat/src/home_views/OnBoardingView2.dart';
import 'package:flutter_chat/src/login_views/LoginView2.dart';
import 'package:flutter_chat/src/login_views/RegisterView2.dart';
import 'package:flutter_chat/src/singleton/DataHolder.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'fb_objects/Perfil2.dart';
import 'home_views/ChatView.dart';
import 'home_views/HomeView2.dart';
import 'login_views/RegisterView.dart';
import 'login_views/SplashView.dart';

class App2 extends StatelessWidget{
  App2({Key? key}) : super(key:key);
  FirebaseFirestore db = FirebaseFirestore.instance;



  @override
  Widget build(BuildContext context) {
    //DataHolder().dSCREEN_WIDTH= MediaQuery.of(context).size.width;

    return MaterialApp(
      initialRoute: '/Home',
      routes: {
        '/Login':(context) => LoginView2(),
        '/Registro':(context) => RegisterView(),
        '/Home':(context) => HomeView(),
        '/OnBoarding':(context) => OnBoardingView2(),
        '/Splash':(context) => SplashView(),
        '/ChatView':(context) => ChatView(),

      },
    );
  }

}