


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eurekalib/grid_views/RoomCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../fb_objects/Perfil2.dart';
import '../fb_objects/Room2.dart';

class HomeView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView>{

  FirebaseFirestore db = FirebaseFirestore.instance;
  String sNombre="AQUI IRA EL NOMBRE";
  List<Room2> chatRooms= [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRoomsList();
  }

  void getRoomsList() async{
    //String Query=SELECT * FROM ROOMS WHERE members>50;
    final docsRef = db.collection("rooms").where("members",isGreaterThan: 50).
    withConverter(fromFirestore: Room2.fromFirestore,
        toFirestore: (Room2 room, _) => room.toFirestore());

    //stmt.executeQuery(Query);
    final docsSnap = await docsRef.get();

    setState(() {
      for(int i=0;i<docsSnap.docs.length;i++){
        chatRooms.add(docsSnap.docs[i].data());
      }
    });

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
        child:
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: chatRooms.length,
            itemBuilder: (BuildContext context, int index) {
              return RoomCard(sImgURL: chatRooms[index].image!,
              sName: chatRooms[index].name!,);
            }
        )


        /*GridView.count(
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
        )*/
      ),
    );
  }

}