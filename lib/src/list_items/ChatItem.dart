import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {

  final String sTexto;
  final Function(int index) onShortClick;
  final int index;

  const ChatItem({Key? key, this.sTexto="mensaje", required this.onShortClick,
    required this.index}) : super(key: key);

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

    return Container(
                height: 25,
                child: Center(child: Text(sTexto)),
              );


  }


}