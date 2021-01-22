import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 5,
          title: Text("Chats"),

        ),
       bottomNavigationBar: BottomNavigationBar(
         selectedItemColor: Colors.white,
         backgroundColor: Colors.blue,
         unselectedItemColor: Colors.white60,
         selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
         unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
         type: BottomNavigationBarType.fixed,
         items: [
           BottomNavigationBarItem(
             icon: Icon(Icons.message),
             title: Text("Chats"),
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.camera_alt),
             title: Text("Camera"),
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.account_box),
             title: Text("Profile"),
           ),
         ],
       ),
       ),
    );
  }
}
