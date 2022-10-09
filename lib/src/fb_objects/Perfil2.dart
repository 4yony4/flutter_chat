import 'package:cloud_firestore/cloud_firestore.dart';

class Perfil2 {
  final String? name;
  final String? city;
  final String? country;
  final int? edad;
  final String uid;

  Perfil2({
    this.name="",
    this.city="",
    this.country="",
    this.edad=0,
    this.uid=""
  });

  factory Perfil2.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Perfil2(
      name: data?['name'],
      city: data?['city'],
      country: data?['country'],
      edad: data?['edad'],
      uid: snapshot.id
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (city != null) "city": city,
      if (country != null) "country": country,
      if (edad != 0) "edad": edad,
    };
  }
}