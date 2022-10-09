
import 'package:flutter_chat/src/fb_objects/Perfil2.dart';

import '../fb_objects/Perfil.dart';
import '../fb_objects/Room.dart';

class DataHolder{

  static final DataHolder _dataHolder = new DataHolder._internal();

  String sCOLLECTION_ROOMS_NAME="rooms";
  String sCOLLECTION_TEXTS_NAME="texts";

  String sMensaje=" ";
  Perfil2 perfil= Perfil2();
  Room selectedChatRoom = Room();

  DataHolder._internal() {
    //text.value = "Lorem ipsum";
    sMensaje = "Lorem ipsum";
  }

  factory DataHolder(){
    return _dataHolder;
  }

  void pruebaFuncion(){

  }

}
