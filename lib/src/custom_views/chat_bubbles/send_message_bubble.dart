import 'package:flutter/material.dart';
import 'package:flutter_chat/src/custom_views/chat_bubbles/chat_trail.dart';
import 'package:flutter_chat/src/singleton/DataHolder.dart';

class SendMessageBubble extends StatelessWidget{

  final String sMessage;
  final String imgUrl;

  const SendMessageBubble({Key? key, required this.sMessage, required this.imgUrl}): super(key: key);

  @override
  Widget build(BuildContext context) {

    final messageTextGroup = Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.cyan[900],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child:Column(
                  children: [
                    Image.network(imgUrl,height: DataHolder().platformAdmin.getScreenHeight(context)*0.4,),
                    Text(
                      sMessage,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                )
              ),
            ),
            CustomPaint(painter: ChatTrail(Colors.cyan[900]!)),
          ],
        ));

    return Padding(
      padding: EdgeInsets.only(right: 8.0, left: 60, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SizedBox(height: 30),
          messageTextGroup,
        ],
      ),
    );
  }




}