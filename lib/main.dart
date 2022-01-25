import 'package:flutter/material.dart';
import 'package:products_app/Layout/tagrba.dart';
import 'package:products_app/modules/HomeScreen/home.dart';
import 'Layout/welcomSrceen.dart';
import 'modules/productScreen/productScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     home: WelcomeScreen(),
    debugShowCheckedModeBanner: false,

    );
  }


}

