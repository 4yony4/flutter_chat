


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/singleton/DataHolder.dart';

import '../custom_views/RFInputText.dart';
import '../fb_objects/Perfil.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OnBoardingViewState();
  }
}

class _OnBoardingViewState extends State<OnBoardingView>{

  var txt = TextEditingController();
  FirebaseFirestore db=FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DataHolder().sMensaje="HOLA DESDE ONBOARDING";

    checkExistingProfile();
  }

  void checkExistingProfile() async{
    String? idUser=FirebaseAuth.instance.currentUser?.uid;
    final docRef = db.collection("perfiles").doc(idUser);

    DocumentSnapshot docsnap= await docRef.get();

    if(docsnap.exists){
      Navigator.of(context).popAndPushNamed("/Home");
    }
    //DataHolder().pruebaFuncion();
  }

  void acceptPressed(String nombre, String Pais, String Ciudad, int edad, BuildContext context) async{
    Perfil pefil = Perfil(name: nombre, country: Pais, city: Ciudad, edad: edad);

    await db.collection("perfiles").doc(FirebaseAuth.instance.currentUser?.uid).set(pefil.toFirestore())
        .onError((e, _) => print("Error writing document: $e"));

    Navigator.of(context).popAndPushNamed("/Home");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    RFInputText inputNombre=RFInputText(iLongitudPalabra: 20,
      sHelperText: "Escriba su Nombre",
      sTitulo:"Nombre",icIzquierdo: Icon(Icons.account_circle_outlined),);

    RFInputText inputPais=RFInputText(iLongitudPalabra: 20,
      sHelperText: "Escriba su Pais",
      sTitulo:"Pais",icIzquierdo: Icon(Icons.account_circle_outlined),);

    RFInputText inputCiudad=RFInputText(iLongitudPalabra: 20,
      sHelperText: "Escriba su Ciudad",
      sTitulo:"Ciudad",icIzquierdo: Icon(Icons.password),);

    RFInputText inputEdad=RFInputText(iLongitudPalabra: 20,
        sHelperText: "Escriba su edad",
        sTitulo:"Edad",icIzquierdo: Icon(Icons.password));


    TextField txtMensajes=TextField(controller:txt,readOnly: true,style: TextStyle(color: Colors.red,fontSize: 18),);

    return Scaffold(
      appBar: AppBar(
        title: Text('On Boarding'),
      ),
      //backgroundColor: Colors.orangeAccent,
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
                  onPressed: () {
                    acceptPressed(inputNombre.getText(),inputPais.getText(),
                        inputCiudad.getText(),int.parse(inputEdad.getText()),context);
                  },
                  child: Text("Aceptar"),
                ),
                OutlinedButton(
                  onPressed: () {

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