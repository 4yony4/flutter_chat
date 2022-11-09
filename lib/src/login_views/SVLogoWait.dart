
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/singleton/DataHolder.dart';

class SVLogoWait extends StatefulWidget{
  final String sLogoPath;
  const SVLogoWait(this.sLogoPath, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _SVLogoWaitState();
  }
}

class _SVLogoWaitState extends State<SVLogoWait> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //FirebaseAuth.instance.signOut();
    loadAllData();

  }

  void loadAllData() async{
    await Future.delayed(Duration(seconds: 2));
    //CARGAMOS TODOS LOS RECURSOS

    if(FirebaseAuth.instance.currentUser==null){
      setState(() {
        Navigator.of(context).popAndPushNamed("/Login");
      });
    }
    else{
      bool existe=await checkExistingProfile();
      if(existe){
        setState(() {
          Navigator.of(context).popAndPushNamed("/Home");
        });
      }
      else{
        setState(() {
          Navigator.of(context).popAndPushNamed("/OnBoarding");
        });
      }



    }
  }

  Future<bool> checkExistingProfile() async{
    String? idUser=FirebaseAuth.instance.currentUser?.uid;
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("perfiles").doc(idUser);

    DocumentSnapshot docsnap= await docRef.get();

    return docsnap.exists;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //DataHolder().platformAdmin.initDisplayData(context);
    print("DEBUG: LA PLATAFORMA TIENE UNA ALTURA: "+DataHolder().platformAdmin.dSCREEN_HEIGHT.toString());

    return Scaffold(
        body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage(widget.sLogoPath),width: DataHolder().platformAdmin.dSCREEN_WIDTH,),
              SizedBox(height: DataHolder().platformAdmin.dSCREEN_HEIGHT/20),
              Text("CARGANDO...",style: TextStyle(fontSize: DataHolder().platformAdmin.dSCREEN_HEIGHT/20)),
              SizedBox(height: DataHolder().platformAdmin.dSCREEN_HEIGHT/20),
              const CircularProgressIndicator(
                semanticsLabel: 'Circular progress indicator',
              )
            ],
          ),
        )
    );
  }

}