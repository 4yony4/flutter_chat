


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../custom_views/RFInputText.dart';

class RegisterView extends StatelessWidget{

  RegisterView({Key? key}) : super(key:key);

  var txt = TextEditingController();

  void registerPressed(String emailAddress, String password, BuildContext context) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      Navigator.of(context).popAndPushNamed('/loginview');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        //print('The account already exists for that email.');
        txt.text="USUARIO YA EXISTE PRUEBA RECUPERAR CONTRASEÑA";
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    RFInputText inputUser=RFInputText(iLongitudPalabra: 20,
      sHelperText: "Escriba su usuario",
      sTitulo:"Usuario",icIzquierdo: Icon(Icons.account_circle_outlined),);

    RFInputText inputPass=RFInputText(iLongitudPalabra: 20,
    sHelperText: "Escriba su contraseña",
    sTitulo:"Cotraseña",icIzquierdo: Icon(Icons.password),blIsPasswordInput: true,);

    RFInputText inputPassRep=RFInputText(iLongitudPalabra: 20,
    sHelperText: "Escriba su contraseña",
    sTitulo:"Repetir Cotraseña",icIzquierdo: Icon(Icons.password),blIsPasswordInput: true);


    TextField txtMensajes=TextField(controller:txt,readOnly: true,style: TextStyle(color: Colors.red,fontSize: 18),);

    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar'),
      ),
      //backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inputUser,
            inputPass,
            inputPassRep,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    if(inputPass.getText()==inputPassRep.getText()) {
                      registerPressed(
                          inputUser.getText(), inputPass.getText(), context);
                    }
                    else{
                      txt.text="ERROR CONTRASEÑAS NO COINCIDEN";
                    }

                    // Respond to button press
                    //print("------>>>>>>>  REGISTRO ACEPTAR");
                  },
                  child: Text("Aceptar"),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Respond to button press
                    Navigator.of(context).popAndPushNamed('/loginview');
                    //print("------>>>>>>>  REGISTRO CANCELAR");
                  },
                  child: Text("Cancelar"),
                )
              ],
            ),
            txtMensajes

          ],
        ),
      ),
    );
  }

}