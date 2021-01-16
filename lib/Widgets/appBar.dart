import 'package:flutter/material.dart';

class Appbar extends StatefulWidget {
  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
      centerTitle: true,
      backgroundColor: Colors.blue,
      elevation: 10,
      title: Text('Log In'),
    )));
  }
}
