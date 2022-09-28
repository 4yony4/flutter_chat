
import 'package:flutter/material.dart';

class RFInputText extends StatelessWidget{

  final String sValorInicial;
  final int iLongitudPalabra;
  final String sHelperText;
  final String sTitulo;
  final Icon icIzquierdo;
  final Icon icDerecho;
  final bool blIsPasswordInput;

  RFInputText({Key? key,
    this.sValorInicial ="",
  this.iLongitudPalabra = 20, this.sHelperText="", this.sTitulo="",
    this.icIzquierdo=const Icon(Icons.favorite),
    this.icDerecho=const Icon(Icons.check_circle),
  this.blIsPasswordInput=false}) : super(key: key);

  final TextEditingController _controller=TextEditingController();

  String getText(){
    return _controller.text;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      controller: _controller,
      cursorColor: Colors.pink,
      maxLength: iLongitudPalabra,
      obscureText: blIsPasswordInput,
      enableSuggestions: !blIsPasswordInput,
      autocorrect: !blIsPasswordInput,
      decoration: InputDecoration(
        icon: this.icIzquierdo,
        labelText: this.sTitulo,
        labelStyle: TextStyle(
          color: Color(0xFF6200EE),
        ),
        helperText: this.sHelperText,
        suffixIcon: this.icDerecho,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF6200EE)),
        ),
      ),
    );

  }



}