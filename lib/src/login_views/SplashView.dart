import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../fb_objects/Perfil2.dart';

class SplashView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _SplashViewState();
  }
}

class _SplashViewState extends State<SplashView> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isUserLogged();
  }

  void isUserLogged() async{
    await Future.delayed(Duration(seconds: 5));

    if(FirebaseAuth.instance.currentUser==null){
      Navigator.of(context).popAndPushNamed("/Login");
    }
    else{
      if(checkPerfilExistance()==true){
        Navigator.of(context).popAndPushNamed("/Home");
      }
      else{
        Navigator.of(context).popAndPushNamed("/OnBoarding");
      }
    }
  }

  Future<bool> checkPerfilExistance() async {
    final docRef = db.collection("perfiles").doc(FirebaseAuth.instance.currentUser?.uid)
        .withConverter(fromFirestore: Perfil2.fromFirestore,
      toFirestore: (Perfil2 perfil, _) => perfil.toFirestore(),
    );

    final docSnap = await docRef.get();
    return docSnap.exists;

    if(docSnap.exists==true){
      return true;
    }
    else{
      return false;
    }

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //isUserLogged(context);
    return Scaffold(
      body: Center(
        child:  Text("Bienvenido a Flutter Chat"),

      )
    );
  }

}