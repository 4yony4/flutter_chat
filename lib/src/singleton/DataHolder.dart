
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chat/src/fb_objects/Perfil2.dart';

import '../fb_objects/Perfil.dart';
import '../fb_objects/Room.dart';
import '../firebase/FbAdmin.dart';
import '../platform/PlatformAdmin.dart';

/**
 *
 */
class DataHolder{

  static final DataHolder _dataHolder = new DataHolder._internal();

  String sCOLLECTION_ROOMS_NAME="rooms";
  String sCOLLECTION_TEXTS_NAME="texts";

  String sMensaje=" ";
  Perfil2 perfil= Perfil2();
  Room selectedChatRoom = Room();
  FBAdmin fbAdmin = FBAdmin();
  late String? fcmToken="";

  late PlatformAdmin platformAdmin;

  DataHolder._internal() {
    //text.value = "Lorem ipsum";
    sMensaje = "Lorem ipsum";
    platformAdmin=PlatformAdmin();
  }

  //void initPlatformAdminDisplaySetting(BuildContext context){
    //platformAdmin.initDisplayData(context);
  //}

  factory DataHolder(){
    return _dataHolder;
  }

  /**
   * @param: none
   * @return Funcion que espera la descarga del perfil y lo guardo en la clase DataHolder
   */
  Future<void> descargarMIPerfil() async{
    perfil=await fbAdmin.descargarPerfil(FirebaseAuth.instance.currentUser?.uid) as Perfil2;
  }

  /**
   * @param idPerfil: Id del perfil que quiero descargar.
   * @return Funcion que espera la descarga del perfil y lo guardo en la clase DataHolder
   */
  Future<void> descargarPerfilGenerico(String? idPerfil) async{
    await fbAdmin.descargarPerfil(idPerfil) as Perfil2;
  }

  bool isMIPerfilDownloaded(){
    return perfil!=null;
  }

  Future<void> getFCMToken() async{
    fcmToken = (await FirebaseMessaging.instance.getToken());
    print("DEBUG: "+fcmToken.toString());

    if(fcmToken!=null){
      requestFCMPermission();
    }
    FirebaseMessaging.instance.onTokenRefresh
        .listen((fcmToken) {
      // TODO: If necessary send token to application server.
      this.fcmToken=fcmToken;
      // Note: This callback is fired at each app startup and whenever a new
      // token is generated.
    })
        .onError((err) {
      // Error getting token.
    });
    //print("DEBUG: GOT FCM TOKEN "+fcmToken.toString());
  }

  Future<void> requestFCMPermission() async{
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('DEBUG: User granted permission: ${settings.authorizationStatus}');

    initForegroundMessages();
  }

  void initForegroundMessages(){
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }



}
