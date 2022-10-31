import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class PlatformAdmin{

  //int iANDROID_PLATFORM=0;
  //int iIOS_PLATFORM=1;
  //int iWEB_PLATFORM=2;
  double dSCREEN_WIDTH=0;
  double dSCREEN_HEIGHT=0;
  late BuildContext context;

  PlatformAdmin();

  void initDisplayData(BuildContext context){
    this.context=context;
    dSCREEN_WIDTH=MediaQuery.of(context).size.width;
    dSCREEN_HEIGHT=MediaQuery.of(context).size.height;
  }

  bool isAndroidPlatform(){
    return defaultTargetPlatform == TargetPlatform.android;
  }

  bool isIOSPlatform(){
    return defaultTargetPlatform == TargetPlatform.iOS;
  }

  bool isWebPlatform(){
    return defaultTargetPlatform != TargetPlatform.android
        && defaultTargetPlatform != TargetPlatform.iOS
        //&& defaultTargetPlatform != TargetPlatform.fuchsia
        //&& defaultTargetPlatform != TargetPlatform.linux
        //&& defaultTargetPlatform != TargetPlatform.windows
        //&& defaultTargetPlatform != TargetPlatform.macOS
    ;
  }

}