import 'package:flutter/material.dart';

class NameBox extends StatelessWidget {
  final String name;

  const NameBox({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.lightBlueAccent),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(name),
      ),
    );
  }
}