
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/NameBox.dart';

class App extends StatelessWidget{

  const App({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      title: 'Flutter Chat',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hola desde Flutter Chat'),
        ),
        backgroundColor: Colors.orangeAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NameBox(name: "Pepe"),
              SizedBox(height: 8.0),
              NameBox(name: "Maria"),
              SizedBox(height: 8.0),
              NameBox(name: "Alvaro"),
              SizedBox(height: 8.0),
              NameBox(name: "Julia"),
            ],

          ),
        ),
      ),
    );
  }

}