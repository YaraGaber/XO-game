import 'package:flutter/material.dart';
import 'package:xo_game/home.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false
      , home: Login(),
      initialRoute:Login.routname ,
      routes: {
        Login.routname : (context) => Login(),
        Home.routname: (context) => Home()


      },

    );
  }
}
