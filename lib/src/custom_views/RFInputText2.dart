


import 'package:flutter/material.dart';

class RFInputText2 extends StatelessWidget{

  const RFInputText2({Key? key, required this.myController}) : super(key:key);

  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      cursorColor: Colors.deepOrange,
      maxLength: 20,
      decoration: InputDecoration(
        icon: Icon(Icons.sailing),
        labelText: 'RF ',
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
