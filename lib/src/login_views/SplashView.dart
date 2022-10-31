import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/singleton/DataHolder.dart';

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
    await Future.delayed(Duration(seconds: 2));

    if(FirebaseAuth.instance.currentUser==null){
      Navigator.of(context).popAndPushNamed("/Login");
    }
    else{
      await DataHolder().descargarMIPerfil();
      if(DataHolder().isMIPerfilDownloaded()==true){
        Navigator.of(context).popAndPushNamed("/Home");
      }
      else{
        Navigator.of(context).popAndPushNamed("/OnBoarding");
      }
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