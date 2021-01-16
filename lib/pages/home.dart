import 'package:flutter/material.dart';
import 'package:instead_app/Widgets/appBar.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        elevation: 10,
        title: Text('Home'),
    )
    );
  }
}
