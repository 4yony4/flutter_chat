


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../fb_objects/Perfil2.dart';

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
    //final docRef = db.collection("perfiles").doc(FirebaseAuth.instance.currentUser?.uid);

    final docRef = db.collection("perfiles").doc(FirebaseAuth.instance.currentUser?.uid)
        .withConverter(fromFirestore: Perfil2.fromFirestore,
      toFirestore: (Perfil2 perfil, _) => perfil.toFirestore(),
    );

    final docSnap = await docRef.get();
    final perfil = docSnap.data(); // Convert to City object
    if (perfil != null) {
      //print("!!!!!!!!!!!!!!!!!!!! "+perfil.name!+"     "+perfil.city!);
      setState(() {
        sNombre=perfil.city!;
      });
    } else {
      print("No such document.");
    }

    /*
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
    */


  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<String> listaNombres= ["Gonzalo","Sonia","Karen"];
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatdar'),
      ),
      //backgroundColor: Colors.orangeAccent,
      body: Center(
        child:GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 30,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[100],
              child: const Text("He'd have you all unravel at the"),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[200],
              child: const Text('Heed not the rabble'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[300],
              child: const Text('Sound of screams but the'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[400],
              child: const Text('Who scream'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[500],
              child: const Text('Revolution is coming...'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[600],
              child: const Text('Revolution, they...'),
            ),
          ],
        )
      ),
    );
  }

}