


import 'package:flutter/material.dart';

import '../custom_views/RFInputText.dart';

class RegisterView extends StatelessWidget{

  const RegisterView({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar'),
      ),
      //backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RFInputText(iLongitudPalabra: 12,
              sHelperText: "Escriba su usuario",
              sTitulo:"Usuario",icIzquierdo: Icon(Icons.account_circle_outlined),),
            RFInputText(iLongitudPalabra: 12,
              sHelperText: "Escriba su contraseña",
              sTitulo:"Cotraseña",icIzquierdo: Icon(Icons.password),),
            RFInputText(iLongitudPalabra: 12,
              sHelperText: "Escriba su contraseña",
              sTitulo:"Repetir Cotraseña",icIzquierdo: Icon(Icons.password),),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // Respond to button press
                    print("------>>>>>>>  REGISTRO ACEPTAR");
                  },
                  child: Text("Aceptar"),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Respond to button press
                    Navigator.of(context).popAndPushNamed('/loginview');
                    //print("------>>>>>>>  REGISTRO CANCELAR");
                  },
                  child: Text("Cancelar"),
                )
              ],
            )

          ],
        ),
      ),
    );
  }

}