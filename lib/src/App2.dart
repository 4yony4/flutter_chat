

import 'package:flutter/material.dart';
import 'package:flutter_chat/src/custom_views/RFInputText2.dart';

class App2 extends StatelessWidget{
  App2({Key? key}) : super(key:key);

  final myControllerInput1 = TextEditingController();
  final myControllerInput2 = TextEditingController();
  final myControllerInput3 = TextEditingController();


  void btn1Pressed(){
    print("------------->>>>>>>>>>>>>>>> HOLA!!!!! "+myControllerInput1.text);

  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home:  Scaffold(
        appBar: AppBar(
          title: const Text('AppBar Demo'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RFInputText2(myController: myControllerInput1),
              RFInputText2(myController: myControllerInput2),
              RFInputText2(myController: myControllerInput3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: btn1Pressed,
                    child: Text("BOTON1"),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      // Respond to button press
                      print("PRESIONASTES BOTON 2");
                    },
                    child: Text("BOTON2"),
                  )
                ],
              )
            ],

          ),
        ),
        backgroundColor: Colors.amber,
      ),


    );
  }



}