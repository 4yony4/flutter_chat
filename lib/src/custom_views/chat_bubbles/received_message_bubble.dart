import 'package:flutter/material.dart';
import 'package:flutter_chat/src/custom_views/chat_bubbles/chat_trail.dart';
import 'dart:math';

class ReceivedMessageBubble extends StatelessWidget{

  final String sMessage;

  const ReceivedMessageBubble({Key? key, required this.sMessage}): super(key: key);

  @override
  Widget build(BuildContext context) {

    final messageTextGroup = Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(pi),
              child: CustomPaint(
                painter: ChatTrail(Colors.grey[300]!),
              ),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child: Text(
                  sMessage,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ),
          ],
        ));

    return Padding(
      padding: const EdgeInsets.only(right: 60, left: 8, top: 5, bottom: 5),
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