import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_views/chat_bubbles/received_message_bubble.dart';
import '../custom_views/chat_bubbles/send_message_bubble.dart';

class ChatItem extends StatelessWidget {

  final String sTexto;
  final Function(int index) onShortClick;
  final int index;
  final String sAuthor;
  final String? imgUrl;

  const ChatItem({Key? key, this.sTexto="mensaje", required this.onShortClick,
    required this.index, required this.sAuthor, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*return ListTile(
      title: Text(sTitulo),
      subtitle: Text('Secondary text'),
      leading: Icon(Icons.label),
      onTap: () {
        onShortClick(index);
      },

    );*/

    /*return Container(
                height: 25,
                child: Center(child: Text(sTexto)),
              );

     */

    if(imgUrl!=null){
      return Image.network(imgUrl!);
    }else{
      if(sAuthor==FirebaseAuth.instance.currentUser?.uid){
        return BubbleSpecialThree(
          text: sTexto,
          //sent: true,
          //seen: true,
          color: Color(0xFF43F31B),
          tail: true,
          textStyle: TextStyle(
              color: Color(0xFF1B4AF3),
              fontSize: 16
          ),
        );
        //return SendMessageBubble(sMessage: sTexto);
      }
      else{
        //return ReceivedMessageBubble(sMessage: sTexto);
        return BubbleSpecialThree(
          text: sTexto,
          color: Color(0xFFE8E8EE),
          tail: true,
          isSender: false,
        );
      }
    }




  }


}