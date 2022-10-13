import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../fb_objects/Perfil2.dart';
import '../singleton/DataHolder.dart';

class FBAdmin{

  FirebaseFirestore db = FirebaseFirestore.instance;

  FBAdmin(){

  }

  Future<Perfil2?> descargarPerfil(String? idPerfil) async {
    final docRef = db.collection("perfiles").doc(idPerfil)
        .withConverter(fromFirestore: Perfil2.fromFirestore,
      toFirestore: (Perfil2 perfil, _) => perfil.toFirestore(),
    );


    final docSnap = await docRef.get();
    //DataHolder().perfil=docSnap.data()!;
    return docSnap.data();
  }
}