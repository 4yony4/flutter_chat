
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool blIsListVisible=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    actualizarLista();
    //getPilotosF1();
  }

  void getPilotosF1() async{


    int iAnio=2022;
    final response = await http
        .get(Uri.parse('http://ergast.com/api/f1/${iAnio}/drivers.json'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      //print("DEBUG: --->>>>>>>>>   "+json.decode(response.body));
      //print("DEBUG: --->>>>>>>>>   "+jsonDecode(response.body).toString());
      Map<String, dynamic> json=jsonDecode(response.body);
      //print("DEBUG: --->>>>>>>>>   "+json["MRData"].toString());
      Map<String, dynamic> json2=json["MRData"];
      //print("DEBUG: --->>>>>>>>>   "+json2["DriverTable"].toString());
      Map<String, dynamic> json3=json2["DriverTable"];
      //print("DEBUG: --->>>>>>>>>   "+json3["Drivers"].toStri ng());
      List<dynamic> listaPilotos=json3["Drivers"];

      List<dynamic> listaPilotos2=json["MRData"]["DriverTable"]["Drivers"];

      List<PilotoF1> listaPilotosFinal=[];

      for(int i=0;i<listaPilotos2.length;i++){
        listaPilotosFinal.add(PilotoF1.fromJson(listaPilotos2[i]));
      }

      print("NOMBRE DEL PILOTO EN LA POSICION 10: "+listaPilotosFinal[10].givenName+"   "+listaPilotosFinal[10].familyName);

      //print("DEBUG: --->>>>>>>>>   "+json["MRData"]["DriverTable"]["Drivers"].toString());

      //return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
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
    //DataHolder().platformAdmin.initDisplayData(context);

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