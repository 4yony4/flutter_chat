
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/custom_views/NameBox.dart';
import 'package:flutter_chat/src/login_views/LoginView.dart';
import 'package:flutter_chat/src/login_views/RegisterView.dart';

class App extends StatelessWidget{

  const App({Key? key}) : super(key:key);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //throw UnimplementedError();
    return MaterialApp(
      title: 'Flutter Chat',
      initialRoute: '/loginview',
      routes: {
        '/loginview':(context) => const LoginView(),
        '/registerview':(context) => const RegisterView(),
      },
    );
  }

}