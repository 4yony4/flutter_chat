
import 'package:flutter/material.dart';

class RFInputText extends StatelessWidget{

  final String sValorInicial;
  final int iLongitudPalabra;
  final String sHelperText;
  final String sTitulo;
  final Icon icIzquierdo;
  final Icon icDerecho;

  const RFInputText({Key? key,
    this.sValorInicial ="",
  this.iLongitudPalabra = 20, this.sHelperText="", this.sTitulo="",
    this.icIzquierdo=const Icon(Icons.favorite),
    this.icDerecho=const Icon(Icons.check_circle)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      cursorColor: Colors.pink,
      initialValue: this.sValorInicial,
      maxLength: iLongitudPalabra,
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