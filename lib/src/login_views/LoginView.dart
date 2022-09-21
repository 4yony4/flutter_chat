


import 'package:flutter/material.dart';

import '../custom_views/RFInputText.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LoginView extends StatelessWidget{

  const LoginView({Key? key}) : super(key:key);


  void loginPressed(String emailAddress, String password) async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      print("ME HE LOGEADO!");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    

    
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    String sUsername="yony@yony.com";
    String sPassword="1234567890";
      return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        //backgroundColor: Colors.orangeAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RFInputText(sValorInicial:sUsername ,iLongitudPalabra: 20,
                sHelperText: "Escriba su usuario",
                  sTitulo:"Usuario",icIzquierdo: Icon(Icons.account_circle_outlined),),
              RFInputText(sValorInicial:sPassword,iLongitudPalabra: 20,
                sHelperText: "Escriba su contraseña",
                sTitulo:"Cotraseña",icIzquierdo: Icon(Icons.password),),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      // Respond to button press
                      print("------>>>>>>>  LOGIN $sUsername $sPassword");
                      loginPressed(sUsername,sPassword);
                    },
                    child: Text("Login"),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/registerview');
                      //Navigator.of(context).pushNamed('/registerview');
                      // Respond to button press
                      //print("------>>>>>>>  REGISTRO");
                    },
                    child: Text("Registro"),
                  )
                ],
              )

            ],
          ),
        ),
      );
  }

}