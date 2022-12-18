import 'package:cloud_firestore/cloud_firestore.dart';

class Perfil {
  final String? name;
  final String? city;
  final String? country;
  final int? edad;
  final List<String>? friends;
  final List<DocumentReference>? rooms;
  final String uid;

  Perfil({
    this.name="",
    this.city="",
    this.country="",
    this.edad=0,
    this.friends= const [],
    this.rooms = const[],
    this.uid=""
  });

  factory Perfil.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Perfil(
      name: data?['name'],
      city: data?['city'],
      country: data?['country'],
      edad: data?['edad'],
      friends: data?['friends'] is Iterable ? List.from(data?['friends']) : null,
      rooms: data?['rooms'] is Iterable ? List.from(data?['rooms']) : null,
      uid: data?['uid'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (city != null) "city": city,
      if (country != null) "country": country,
      if (edad != 0) "edad": edad,
      if (friends!.isNotEmpty) "friends": friends,
      if (rooms!.isNotEmpty) "rooms": rooms,
    };
  }
}