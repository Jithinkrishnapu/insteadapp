import 'package:flutter/material.dart';
import 'package:instead_app/userspart/insteadLogin.dart';
import 'package:instead_app/userspart/signUppage.dart';

class AuthsignandUp extends StatefulWidget {
  @override
  _AuthsignandUpState createState() => _AuthsignandUpState();
}

class _AuthsignandUpState extends State<AuthsignandUp> {
  bool showSignIn = true;

  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
   if(showSignIn){
     return LoginPage(toggleView);
   }else{
     return SignUpPage(toggleView);
   }
  }
}
