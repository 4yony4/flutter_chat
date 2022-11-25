import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../custom_views/RFInputText2.dart';
import '../singleton/DataHolder.dart';

class LoginView2 extends StatelessWidget {
  LoginView2({Key? key}) : super(key: key);

  RFInputText2 input1 = RFInputText2(sTitulo: "Usuario",);
  RFInputText2 input2 = RFInputText2(sTitulo: "Password",blIsPassword: true,);



  void btn1Pressed(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: input1.getText(),
        password: input2.getText(),
      );
      Navigator.of(context).popAndPushNamed("/OnBoarding");
    } on FirebaseAuthException catch (e) {
      print("------->>>>   ERROR DE CREACION DE USUARIO " + e.code);
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
    //DataHolder().pruebaFuncion();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('ChatFlutter Login'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              input1,
              input2,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: (){
                      btn1Pressed(context);
                    },
                    child: Text("BOTON1"),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed("/Registro");
                      // Respond to button press
                      //print("PRESIONASTES BOTON 2");
                    },
                    child: Text("REGISTRAR"),
                  )
                ],
              )
            ],

          ),
        ),
        backgroundColor: Colors.amber,
      );
  }
}