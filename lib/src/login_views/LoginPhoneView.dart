
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/custom_views/RFInputText.dart';

class LoginPhoneView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginPhoneViewState();
  }
}

class _LoginPhoneViewState extends State<LoginPhoneView>{

  RFInputText inputTextPhone=RFInputText(sTitulo: "Numero Telefono",);
  RFInputText inputTextCode=RFInputText(sTitulo: "Codigo Verificacion",);
  bool blIsWaitingForSMS=false;
  late String verificationId;

  void enviarTelefono(String phoneNumber,BuildContext context) async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async{
        await FirebaseAuth.instance.signInWithCredential(credential);
        print("ME HE LOGEADO!");
        Navigator.of(context).popAndPushNamed('/home');
      },
      verificationFailed: (FirebaseAuthException e) {

      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId=verificationId;
        setState(() {
          blIsWaitingForSMS=true;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {

      },
    );

  }

  void enviarCodigo(String smsCode,BuildContext context) async{
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

    // Sign the user in (or link) with the credential
    await FirebaseAuth.instance.signInWithCredential(credential);
    print("ME HE LOGEADO!");
    Navigator.of(context).popAndPushNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Phone'),
      ),
      //backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inputTextPhone,
            OutlinedButton(
              onPressed: (){
                enviarTelefono(inputTextPhone.getText(),context);
              },
              child: Text("Enviar"),
            ),
            if(blIsWaitingForSMS)inputTextCode,
            if(blIsWaitingForSMS)
              OutlinedButton(
              onPressed: (){
                enviarCodigo(inputTextCode.getText(), context);
              },
              child: Text("Enviar"),
            )
          ],
        ),
      ),
    );
  }

}