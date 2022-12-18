
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/custom_views/RFInputText2.dart';
import 'package:flutter_chat/src/json_objects/PilotoF1.dart';
import 'package:flutter_chat/src/list_items/RoomItem.dart';
import 'package:flutter_chat/src/singleton/DataHolder.dart';

import '../fb_objects/Perfil.dart';
import '../fb_objects/Perfil2.dart';
import '../fb_objects/Room.dart';
import 'package:http/http.dart' as http;

class ContactsListView extends StatefulWidget{
  const ContactsListView({super.key});

  @override
  State<StatefulWidget> createState() {

    return _ContactsListViewState();
  }
}

class _ContactsListViewState extends State<ContactsListView>{
  FirebaseFirestore db = FirebaseFirestore.instance;
  String sNombre="---";
  bool blIsButtonVisible=true;
  List<Perfil> misAmigos = [];
  bool blIsListVisible=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    actualizarLista();

    print("DEBUG: CONCTACTSVIEW --->>"+DataHolder().perfil1.friends.toString());

  }



  void actualizarLista() async{
    final docRef = db.collection("perfiles").
        where("uid",whereIn: DataHolder().perfil1.friends).
    withConverter(fromFirestore: Perfil.fromFirestore,
        toFirestore: (Perfil perfil, _) => perfil.toFirestore());

    final docsSnap = await docRef.get();

    setState(() {
      for(int i=0;i<docsSnap.docs.length;i++){
        misAmigos.add(docsSnap.docs[i].data());
      }
    });
  }

  void listItemShortClicked(int index){
    //print("DEBUG: "+index.toString());
    //print("DEBUG: "+chatRooms[index].name!);
    //DataHolder().selectedChatRoom=chatRooms[index];
    //Navigator.of(context).pushNamed("/ChatView");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //DataHolder().platformAdmin.initDisplayData(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Contactos"),
      ),
      //backgroundColor: Colors.orangeAccent,
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: misAmigos.length,
          itemBuilder: (BuildContext context, int index) {
            return Text("NOMBRE PERFIL: "+misAmigos[index].name!);
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