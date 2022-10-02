
import '../fb_objects/Perfil.dart';

class DataHolder{

  static final DataHolder _dataHolder = new DataHolder._internal();

  String sMensaje=" ";
  Perfil perfil= Perfil();

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
