
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';



class AuthenticationService{
  final FirebaseAuth _auth = FirebaseAuth.instance;



  Future CreateNewUser(String email,String password)async{
    try{
      UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return user;

    }catch(e){
      print(e.toString());
    }
  }
 }