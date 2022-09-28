


import 'package:flutter/material.dart';

class RFInputText2 extends StatelessWidget{
  final String sTitulo;
  final bool blIsPassword;
  final TextEditingController myController = TextEditingController(text: "");

  RFInputText2({Key? key, this.sTitulo="", this.blIsPassword=false}) : super(key:key);


  String getText(){
    return myController.text;
  }

  @override
  Widget build(BuildContext context) {


    return TextFormField(
      obscureText: blIsPassword,
      controller: myController,
      cursorColor: Colors.deepOrange,
      maxLength: 20,
      onChanged: (String s){
        print("------------------>>>>>>>>>>>>>>>>>  "+s);
      },
      decoration: InputDecoration(
        icon: Icon(Icons.sailing),
        labelText: sTitulo,
        labelStyle: TextStyle(
          color: Color(0xFF6200EE),
        ),
        helperText: 'Helper text',
        suffixIcon: Icon(
          Icons.access_time,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF6200EE)),
        ),
      ),

    );
  }

}
