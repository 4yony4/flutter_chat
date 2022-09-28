

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/custom_views/RFInputText2.dart';
import 'package:flutter_chat/src/login_views/LoginView2.dart';
import 'package:flutter_chat/src/login_views/RegisterView2.dart';

class App2 extends StatelessWidget{
  App2({Key? key}) : super(key:key);

  RFInputText2 input1 = RFInputText2();
  RFInputText2 input2 = RFInputText2();
  RFInputText2 input3 = RFInputText2();


  void btn1Pressed() async{

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: input1.getText(),
        password: input2.getText(),
      );
    } on FirebaseAuthException catch (e) {
      print("------->>>>   ERROR DE CREACION DE USUARIO "+e.code);
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    print("USUARIO CREADO CORRECTAMENTE");

    //print("------------->>>>>>>>>>>>>>>> HOLA!!!!! "+input1.getText());
    //print("------------->>>>>>>>>>>>>>>> HOLA!!!!! "+input2.getText());
    //print("------------->>>>>>>>>>>>>>>> HOLA!!!!! "+input3.getText());
    //myControllerInput1.clear();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: "/Login",
      routes: {
        '/Login':(context) => LoginView2(),
        '/Registro':(context) => RegisterView2(),
      },
    );
  }

}