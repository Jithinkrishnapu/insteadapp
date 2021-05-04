import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instead_app/pages/Chat/chatpage.dart';
import 'package:instead_app/run_insteadapp.dart';
import 'package:instead_app/services/helper.dart';
import 'package:instead_app/userspart/insteadLogin.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth firebaseAuth = new FirebaseAuth.instanceFor(app:Firebase.app());
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 5,
          title: Text("Chats"),
          actions: [
            IconButton(onPressed: (){
              _signOut();
             Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthsignandUp()));
            }, icon: Icon(Icons.logout))
          ],

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
             label: "Chats"),
           BottomNavigationBarItem(
             icon: Icon(Icons.camera_alt), label: "Camera"),
           BottomNavigationBarItem(
             icon: Icon(Icons.account_box),
             label: "Profile"),
         ],
       ),
       body: ChatPage(),
       ),
    );
  }
}
