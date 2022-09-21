

import 'package:flutter/material.dart';
import 'package:flutter_chat/src/custom_views/RFInputText2.dart';

class App2 extends StatelessWidget{
  App2({Key? key}) : super(key:key);

  RFInputText2 input1 = RFInputText2();
  RFInputText2 input2 = RFInputText2();
  RFInputText2 input3 = RFInputText2();


  void btn1Pressed(){

    print("------------->>>>>>>>>>>>>>>> HOLA!!!!! "+input1.getText());
    print("------------->>>>>>>>>>>>>>>> HOLA!!!!! "+input2.getText());
    print("------------->>>>>>>>>>>>>>>> HOLA!!!!! "+input3.getText());
    //myControllerInput1.clear();
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
              input1,
              input2,
              input3,
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