import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../custom_views/RFInputText2.dart';
import '../fb_objects/Perfil2.dart';

class OnBoardingView2 extends StatelessWidget {
  OnBoardingView2({Key? key}) : super(key: key);

  RFInputText2 inputNombre = RFInputText2( sTitulo: "Nombre",);
  RFInputText2 inputPais = RFInputText2(sTitulo: "Pais",);
  RFInputText2 inputCiudad = RFInputText2(sTitulo: "Ciudad",);
  RFInputText2 inputEdad = RFInputText2(sTitulo: "Edad",);
  FirebaseFirestore db=FirebaseFirestore.instance;

  void btn1Pressed() async {
    Perfil2 perfil2= new Perfil2(
        name: inputNombre.getText(),
        country: inputPais.getText(),
        city: inputCiudad.getText(),
        edad: int.parse( inputEdad.getText()));

    print("-------->>>>>>>>> !!!!!!!!!!!!!!   "+perfil2.edad.toString());

    db
        .collection("perfiles")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set(perfil2.toFirestore())
        .onError((e, _) => print("Error writing document: $e"));
  }

  @override
  Widget build(BuildContext context) {
    inputNombre.setInitialValue("VALOR INICIAL NOMBRE!");



    return Scaffold(
      appBar: AppBar(
        title: const Text('OnBoarding'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inputNombre,
            inputPais,
            inputCiudad,
            inputEdad,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: btn1Pressed,
                  child: Text("ACEPTAR"),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Respond to button press
                    print("PRESIONASTES BOTON 2");
                  },
                  child: Text("CANCELAR"),
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