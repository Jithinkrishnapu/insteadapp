import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:instead_app/pages/Chat/chatpage.dart';
import 'package:instead_app/pages/home.dart';
import 'package:instead_app/userspart/insteadLogin.dart';
import 'package:instead_app/userspart/signUppage.dart';
import 'package:instead_app/pages/welcome.dart';

class InsteadApp extends StatefulWidget {
  @override
  _InsteadAppState createState() => _InsteadAppState();
}

class _InsteadAppState extends State<InsteadApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
