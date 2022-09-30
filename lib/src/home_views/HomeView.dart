


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView>{

  FirebaseFirestore db = FirebaseFirestore.instance;
  String sNombre="AQUI IRA EL NOMBRE";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
  }

  void getProfile() async{
    final docRef = db.collection("perfiles").doc(FirebaseAuth.instance.currentUser?.uid);

    await docRef.get().then(
          (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print("--------->>>>>>>>>>>>>>>>  "+data?['name']);

        setState(() {
          sNombre=data?['name'];
        });
        // ...
      },
      onError: (e) => print("Error getting document: $e"),
    );



  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('Chatdar'),
      ),
      //backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HOME VIEW BIENVENIDO: "+sNombre)
          ],
        ),
      ),
    );
  }

}