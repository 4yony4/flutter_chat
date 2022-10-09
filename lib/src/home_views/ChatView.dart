
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/custom_views/RFInputText.dart';
import 'package:flutter_chat/src/custom_views/RFInputText2.dart';
import 'package:flutter_chat/src/list_items/ChatItem.dart';

import '../fb_objects/FBText.dart';
import '../singleton/DataHolder.dart';

class ChatView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _ChatViewState();
  }
}

class _ChatViewState extends State<ChatView>{
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<FBText> chatTexts = [];
  RFInputText inputMsg=RFInputText(iLongitudPalabra: 200,);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //print("DEBUG: "+DataHolder().selectedChatRoom.name!);
    descargarTextos();
  }

  void descargarTextos() async{
    chatTexts.clear();

    String path=DataHolder().sCOLLECTION_ROOMS_NAME+"/"+
        DataHolder().selectedChatRoom.uid+
        "/"+DataHolder().sCOLLECTION_TEXTS_NAME;

    final docRef = db.collection(path).
    withConverter(fromFirestore: FBText.fromFirestore,
        toFirestore: (FBText fbtext, _) => fbtext.toFirestore());



    final docSnap = await docRef.get();

    setState(() {
      for(int i=0;i<docSnap.docs.length;i++){
        chatTexts.add(docSnap.docs[i].data());
      }
    });
  }

  void sendPressed()async {
    String path=DataHolder().sCOLLECTION_ROOMS_NAME+"/"+
        DataHolder().selectedChatRoom.uid+
        "/"+DataHolder().sCOLLECTION_TEXTS_NAME;

    final docRef = db.collection(path);

    FBText texto=FBText(text:inputMsg.getText(),
    author: DataHolder().perfil.uid,time: Timestamp.now());

    await docRef.add(texto.toFirestore());

    descargarTextos();

  }

  void listItemShortClicked(int index){

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text(DataHolder().selectedChatRoom.name!),
      ),
      //backgroundColor: Colors.orangeAccent,
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.amberAccent,
              height: 400,
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: chatTexts.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChatItem(sTexto: chatTexts[index].text!,
                    onShortClick: listItemShortClicked,index: index,);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                  //return RFInputText2(sTitulo: "DIVISOR DEL: "+entries[index],);
                },
              ),
            ),
              inputMsg,
              OutlinedButton(
                onPressed: sendPressed,
                child: Text("Send"),
              )

          ],
        )

      ),
    );
  }
  
  
  
}