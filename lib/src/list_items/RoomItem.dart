import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomItem extends StatelessWidget {

  final String sTitulo;

  const RoomItem({Key? key, this.sTitulo="Titulo"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: Text(sTitulo),
      subtitle: Text('Secondary text'),
      leading: Icon(Icons.label),

    );
    /*
    Container(
                height: 100,
                color: Colors.amber[colorCodes[index]],
                child: Center(child: Text('Entry ${entries[index]}')),
              );
     */

  }


}