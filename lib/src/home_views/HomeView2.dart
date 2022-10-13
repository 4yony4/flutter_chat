
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/custom_views/RFInputText2.dart';
import 'package:flutter_chat/src/list_items/RoomItem.dart';
import 'package:flutter_chat/src/singleton/DataHolder.dart';

import '../fb_objects/Perfil.dart';
import '../fb_objects/Perfil2.dart';
import '../fb_objects/Room.dart';

class HomeView2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _HomeView2State();
  }
}

class _HomeView2State extends State<HomeView2>{
  FirebaseFirestore db = FirebaseFirestore.instance;
  String sNombre="---";
  bool blIsButtonVisible=true;
  List<Room> chatRooms = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    actualizarLista();
  }

  /*
  void actualizarNombre()async{
    String? idUser=FirebaseAuth.instance.currentUser?.uid;

    final docRef = db.collection("perfiles").
    doc(idUser).withConverter(fromFirestore: Perfil2.fromFirestore,
        toFirestore: (Perfil2 perfil, _) => perfil.toFirestore());

    final docSnap = await docRef.get();
    //final perfilUsuario = docSnap.data(); // Convert to Perfil object
    DataHolder().perfil=docSnap.data()!;

    if (DataHolder().perfil != null) {
      print(DataHolder().perfil.edad);
      setState(() {
        sNombre=DataHolder().perfil.name!;
      });
    } else {
      print("No such document.");
    }

  }
  */
  void actualizarLista() async{
    final docRef = db.collection("rooms").
    withConverter(fromFirestore: Room.fromFirestore,
        toFirestore: (Room room, _) => room.toFirestore());

    final docsSnap = await docRef.get();

    setState(() {
      for(int i=0;i<docsSnap.docs.length;i++){
        chatRooms.add(docsSnap.docs[i].data());
      }
    });
  }

  void listItemShortClicked(int index){
    print("DEBUG: "+index.toString());
    print("DEBUG: "+chatRooms[index].name!);
    DataHolder().selectedChatRoom=chatRooms[index];
    Navigator.of(context).pushNamed("/ChatView");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido: '+DataHolder().perfil.name!),
      ),
      //backgroundColor: Colors.orangeAccent,
      body: Center(
        child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: chatRooms.length,
            itemBuilder: (BuildContext context, int index) {
              return RoomItem(sTitulo: chatRooms[index].name!,
                onShortClick: listItemShortClicked,index: index,);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
              //return RFInputText2(sTitulo: "DIVISOR DEL: "+entries[index],);
            },
        ),
      ),
    );
  }



}