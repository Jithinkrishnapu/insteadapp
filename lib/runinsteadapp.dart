import 'package:flutter/material.dart';
import 'package:instead_app/pages/home.dart';
import 'package:instead_app/pages/insteadLogin.dart';
import 'package:instead_app/pages/starInstead.dart';

class InsteadApp extends StatefulWidget {
  @override
  _InsteadAppState createState() => _InsteadAppState();
}

class _InsteadAppState extends State<InsteadApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "myapp",
      home:
        Scaffold(
          backgroundColor: Colors.blue,
          body:Center(
          child: StartPage(
        ),
        ),

    ),
    );

  }
}
